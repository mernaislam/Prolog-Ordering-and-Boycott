:-consult(data).

% question 1
list_orders(Name, L):-
    customer(ID, Name),
    getOrders(ID, L, 1),!.

getOrders(ID, L, OrderID):-
    order(ID, OrderID, Items),
    NewOrderID is OrderID + 1,
    getOrders(ID, NewL, NewOrderID),
    L = [order(ID, OrderID, Items)| NewL].
getOrders(_, [], _).

% question 2
countOrdersOfCustomer(Name, Count):-
    list_orders(Name, Orders),
    count(Orders, Count).

count([_|T], Count):-
    count(T, NewCount),
    Count is NewCount + 1.
count([], 0).

% question 3
getItemsInOrderById(Name, OrderID, Items):-
    customer(ID, Name),
    order(ID, OrderID, Items), !.

% question 4
getNumOfItems(Name,OrderID,Count):-
    getItemsInOrderById(Name,OrderID,Items),
    length(Items, Count).

% question 5
getPrice(Item, ItemPrice):-
    item(Item, _, ItemPrice).

iterate([], 0).

iterate([S|E], TotalPrice):-
    getPrice(S, ItemPrice),
    iterate(E, RestPrice),
    TotalPrice is ItemPrice + RestPrice.

calcPriceOfOrder(Username, OrderID, TotalPrice):-
    customer(CustID, Username),
    order(CustID, OrderID, Items),
    iterate(Items, TotalPrice).

% question 6
isBoycott(Company):-
    boycott_company(Company, _).

isBoycott(Item):-
    item(Item, Company, _),
    isBoycott(Company).

% quesition 7
whyToBoycott(Company, Justification):-
    boycott_company(Company, Justification).

whyToBoycott(Item, Justification):-
    item(Item, Company, ItemPrice),
    boycott_company(Company, Justification).

% question 9
replaceItem(Item, NewItem):-
    isBoycott(Item), alternative(Item, _) -> alternative(Item, NewItem) ; NewItem = Item.

replace([], []).

replace([S| E], [Alternative| NewList]):-
    replaceItem(S, Alternative),
    replace(E, NewList).
    
replaceBoycottItemsFromAnOrder(Username, OrderID, NewList):-
    customer(CustID, Username),
    order(CustID, OrderID, L),
    replace(L, NewList).

% question 10
calcPriceAfterReplacingBoycottItemsFromAnOrder(Username, OrderID, NewList, TotalPrice):-
    replaceBoycottItemsFromAnOrder(Username, OrderID, NewList),
    iterate(NewList, TotalPrice).

% question 11
getTheDifferenceInPriceBetweenItemAndAlternative(Item, Alternative, DiffPrice):-
    item(Item, _, ItemPrice),
    alternative(Item, Alternative),
    item(Alternative, _, AltPrice),
    DiffPrice is ItemPrice - AltPrice.






















