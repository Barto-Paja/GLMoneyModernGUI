#ifndef DATABASECURSOR_HPP
#define DATABASECURSOR_HPP

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>

#include "DataStructs.hpp"

class DataBaseException : public std::exception
{
    QString message;
public:

    DataBaseException(const QString & msg) : message{msg} {}

    const QString what() {
        return message;
    }
};

class DataBaseCursor : public QObject
{
    Q_OBJECT

    QSqlDatabase m_db;
    QString m_lastError;

    QVector<Account*> m_accounts;
    QVector<TransactionMember*> m_members;
    QVector<Payee*> m_payees;

    QVector<Category*> m_categories;
    QMap<int,QVector<SubCategory*>> m_subCategories;

    QVector<SubCategory*> m_selectedSubcategories;

public:
    explicit DataBaseCursor(QObject *parent = nullptr);

    const QVector<Account *> &accounts() const;
    const QVector<TransactionMember*> &members() const;
    const QVector<Payee*> &payees() const;
    const QVector<Category*> &categories() const;
    const QMap<int, QVector<SubCategory *> > &subCategories() const;

    Q_INVOKABLE void loadSelectedCategory(const int & ID);
    Q_INVOKABLE bool addNewTransaction(const QDate & date, const int & payee_id, const double & amount, const int & category_id, const int & member_id, const int & account_id, const QString & note, const int & multiplicand, const QString & gui_note);

    const QVector<SubCategory *> &selectedSubcategories() const;

private:

    bool LoadData();
    bool LoadDictionaries();
    bool LoadAccounts();
    bool LoadMembers();
    bool LoadPayees();
    bool LoadCategories();

    Q_PROPERTY(QVector<Account*> accounts READ accounts CONSTANT)
    Q_PROPERTY(QVector<TransactionMember*> members READ members CONSTANT)
    Q_PROPERTY(QVector<Payee*> payees READ payees CONSTANT)
    Q_PROPERTY(QVector<Category*> categories READ categories CONSTANT)
    Q_PROPERTY(QMap<int, QVector<SubCategory*> > subCategories READ subCategories CONSTANT)
    Q_PROPERTY(QVector<SubCategory *> selectedSubcategories READ selectedSubcategories CONSTANT)

    bool AddNewTransaction(const NewTransaction & transaction);
};
#endif // DATABASECURSOR_HPP
