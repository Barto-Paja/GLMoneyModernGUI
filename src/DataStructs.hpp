#ifndef DATASTRUCTS_H
#define DATASTRUCTS_H

#include <QString>
#include <QDate>

#include <QObject>
#include <QStandardItemModel>

/*!
 * \brief The Member struct
 *
 * \note Członek rodziny, do niego przypisywane są koszta.
 */
class TransactionMember : public QStandardItemModel {

    Q_OBJECT
    Q_PROPERTY(QString Name MEMBER Name CONSTANT);
    Q_PROPERTY(int ID MEMBER ID CONSTANT);

public:

    QString Name;
    int ID{0};

    TransactionMember() = default;
    ~TransactionMember() = default;

    TransactionMember(const int & id, const QString & name) :
       Name{ name }, ID{ id }
    {

    }
};
Q_DECLARE_METATYPE(TransactionMember)

/*!
 * \brief The Payee struct
 *
 * \note Płatnik, kontrahent - do niego przypisywane są traksakcje.
 */
class Payee : public QStandardItemModel {

    Q_OBJECT
    Q_PROPERTY(QString Name MEMBER Name CONSTANT);
    Q_PROPERTY(QString SubcategoryName MEMBER SubcategoryName CONSTANT);
    Q_PROPERTY(int ID MEMBER ID CONSTANT);
    Q_PROPERTY(int SuggestedSubCategoryID MEMBER SuggestedSubCategoryID CONSTANT);

public:

    QString Name;
    QString SubcategoryName;
    int ID{0};
    int SuggestedSubCategoryID{0};

    Payee() = default;
    ~Payee() = default;

    Payee(const int & id, const QString & name, const int & suggested_category_id, const QString & subcategory_name)
        : Name { name }, SubcategoryName{ subcategory_name }, ID { id }, SuggestedSubCategoryID { suggested_category_id }
    {

    }
};
Q_DECLARE_METATYPE(Payee)

/*!
 * \brief The Category struct
 *
 */
class Category : public QStandardItemModel{

    Q_OBJECT
    Q_PROPERTY(QString Name MEMBER Name CONSTANT);
    Q_PROPERTY(int ID MEMBER ID CONSTANT);

public:

    QString Name;
    int ID{0};


    Category() = default;
    ~Category() = default;

    Category(const int & id, const QString & name)
        : Name { name }, ID { id }
    {

    }
};
Q_DECLARE_METATYPE(Category)

/*!
 * \brief The SubCategory struct
 */
class SubCategory : public QStandardItemModel {

    Q_OBJECT
    Q_PROPERTY(QString Name MEMBER Name CONSTANT);
    Q_PROPERTY(int ID MEMBER ID CONSTANT);

public:

    QString Name;
    int ID;
    int RootID;

    SubCategory() = default;
    ~SubCategory() = default;

    SubCategory(const int & id, const QString & name, const int & root_id)
        : Name { name }, ID { id }, RootID { root_id }
    {

    }
};

/*!
 * \brief The Account class
 *
 * \note Konto, źródło, z którego ściągane są lub wpłacane na nie środki z transakcji.
 */
class Account : public QStandardItemModel {

    Q_OBJECT
    Q_PROPERTY(QString Name MEMBER Name CONSTANT);
    Q_PROPERTY(int ID MEMBER ID CONSTANT);

public :
    QString Name;
    int ID;

    Account() = default;
    ~Account() = default;

    Account(const int & id, const QString & name)
        : Name { name }, ID { id }
    {

    }
};
Q_DECLARE_METATYPE(Account)

enum class BALANCE{
    EXPANSE = 0,
    INCOME
};

struct Transaction {

    TransactionMember Member;
    Payee Payee;
    Category Category;
    SubCategory SubCategory;
    QDate Date;
    QString note;
    double amount {0.00};
    int ID;
    int accountId {0};
    int multiplicand {-1};

    Transaction() = default;
    ~Transaction() = default;
};

#endif // DATASTRUCTS_H
