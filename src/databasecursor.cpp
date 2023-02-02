#include "databasecursor.hpp"
#include <QSqlQuery>
#include <QDebug>

const QVector<Account*> &DataBaseCursor::accounts() const
{
    return m_accounts;
}

const QVector<TransactionMember*> &DataBaseCursor::members() const
{
    return m_members;
}

const QVector<Payee*> &DataBaseCursor::payees() const
{
    return m_payees;
}

const QVector<Category*> &DataBaseCursor::categories() const
{
    return m_categories;
}

const QMap<int, QVector<SubCategory*> > &DataBaseCursor::subCategories() const
{
    return m_subCategories;
}

void DataBaseCursor::loadSelectedCategory(const int &ID)
{
    qDebug() << "Dzień dobry " << ID;
    m_selectedSubcategories.clear();
    m_selectedSubcategories.reserve( m_subCategories[ID].size());

    for(const auto & sc : m_subCategories[ID])
    {
        m_selectedSubcategories.append(new SubCategory(sc->ID,sc->Name,sc->RootID));
    }
}

const QVector<SubCategory *> &DataBaseCursor::selectedSubcategories() const
{
    return m_selectedSubcategories;
}

DataBaseCursor::DataBaseCursor(QObject *parent)
    : QObject{parent}, m_db{QSqlDatabase::addDatabase("QSQLITE")}
{
    if(!LoadData())
    {
        //throw DataBaseException(m_lastError);
        qDebug() << m_lastError;
    }

    qDebug() << "OK!";
}

bool DataBaseCursor::LoadData()
{
    m_db.setDatabaseName("./data_budzet.db");

    if(m_db.open())
    {
        return LoadDictionaries();
    }
    else
    {
        m_lastError += "Połączenie z bazą danych nie powiodło się.\n";
        m_lastError += m_db.lastError().text();
    }

    return false;
}

bool DataBaseCursor::LoadDictionaries()
{
    const QString error_message{"Ładowanie słowników nie powiodło się.\n"};

    if(!LoadAccounts())
    {
        m_lastError += error_message;
        return false;
    }

    if(!LoadMembers())
    {
        m_lastError += error_message;
        return false;
    }

    if(!LoadPayees())
    {
        m_lastError += error_message;
        return false;
    }

    if(!LoadCategories())
    {
        m_lastError += error_message;
        return false;
    }

    return true;
}

bool DataBaseCursor::LoadAccounts()
{
    QSqlQuery query{m_db};
    query.prepare("SELECT a.account_id, a.name FROM account a ");

    if(query.exec())
    {
        while (query.next()) {
            m_accounts.append(new Account{
                query.value("account_id").toInt(),
                query.value("name").toString()
            });
        }

        return true;
    }
    else
    {
        m_lastError += "Błąd podczas pobierania informacji o kontach.\n";
        m_lastError += query.lastQuery() + "\n";
        m_lastError += query.lastError().text() + "\n";
    }

    return false;
}

bool DataBaseCursor::LoadMembers()
{
    QSqlQuery query{m_db};

    query.prepare("SELECT m.member_id, m.name FROM member m ");

    if(query.exec())
    {
        while (query.next()) {
            m_members.append(new TransactionMember{
                query.value("member_id").toInt(),
                query.value("name").toString()
            });
        }

        return true;
    }
    else
    {
        m_lastError += "Błąd podczas pobierania informacji o członkach rodziny.\n";
        m_lastError += query.lastError().text() + "\n";
        m_lastError += query.lastQuery() + "\n";
    }

    return false;
}

bool DataBaseCursor::LoadPayees()
{
    QSqlQuery query{m_db};
    query.prepare("SELECT p.payee_id, p.name as payee_name, p.description, p.subcategory_id, s.name as subcategory_name FROM Payee p "
                  "INNER JOIN Subcategory s ON p.subcategory_id = s.subcategory_id; ");

    if(query.exec())
    {
        while (query.next()) {
            m_payees.append(new Payee{
                query.value("payee_id").toInt(),
                query.value("payee_name").toString(),
                query.value("subcategory_id").toInt(),
                query.value("subcategory_name").toString()
            });
        }

        return true;
    }
    else
    {
        m_lastError += "Błąd podczas pobierania informacji o płatnikach i kontrahentach.\n";
        m_lastError += query.lastError().text() + "\n";
        m_lastError += query.lastQuery() + "\n";
    }

    return false;
}

bool DataBaseCursor::LoadCategories()
{
    QSqlQuery query {m_db};

    query.prepare("SELECT c.category_id , c.name FROM category c");

    if(query.exec())
    {
        while (query.next()) {

            m_categories.append(new Category{
                query.value("category_id").toInt(),
                query.value("name").toString()
            });

            QSqlQuery subQuery {m_db};
            subQuery.prepare("SELECT s.subcategory_id, s.name "
                          "FROM Subcategory s "
                          "WHERE s.category_id = " +
                          QString::number(query.value("category_id").toInt()));

            if(subQuery.exec())
            {
                QVector<SubCategory*> subcategories;

                while(subQuery.next())
                {
                    subcategories.append(new SubCategory{
                        subQuery.value("subcategory_id").toInt(),
                        subQuery.value("name").toString(),
                        query.value("category_id").toInt()
                    });
                }

                m_subCategories.insert(query.value("category_id").toInt(),subcategories);
            }
            else
            {
                m_lastError += "Błąd podczas pobierania informacji o kategoriach.\n";
                m_lastError += subQuery.lastError().text() + "\n";
                m_lastError += subQuery.lastQuery() + "\n";
                goto error;
            }

        }

        return true;
    }
    else
    {
        m_lastError += "Błąd podczas pobierania informacji o kategoriach.\n";
        m_lastError += query.lastError().text() + "\n";
        m_lastError += query.lastQuery() + "\n";
        goto error;
    }

    qDebug() << query.lastError().text() << "\n" << query.lastQuery();
    error:
    return false;
}

