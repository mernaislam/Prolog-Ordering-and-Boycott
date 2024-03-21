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
isBoycott(X):-
    boycott_company(X, _);
    alternative(X, _).


% question 11
getTheDifferenceInPriceBetweenItemAndAlternative(Item, Alternative, DiffPrice):-
    item(Item, _, ItemPrice),
    alternative(Item, Alternative),
    item(Alternative, _, AltPrice),
    DiffPrice is ItemPrice - AltPrice.






















