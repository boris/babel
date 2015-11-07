![](https://s-media-cache-ak0.pinimg.com/236x/7b/c2/fe/7bc2fe1f81c703e25755942d67de8fa4.jpg)

## Motivation

There are A LOT of books in my house, and by "A LOT" I mean more than 4 meters
and a half if you put one on top of each other.

And all of those books are "tracked" on Google Spreadsheets. Not cool.

## What is this?
This is a very simple Rails application to track the information and "status" of
my Wife's books.

![](https://github.com/boris/babel/blob/master/screenshot.png)

## Roadmap

- ~~Read/Unread books~~
- ~~User auth~~
- ~~Add support for borrowed books~~
- ~~Add a new theme. The [Stallman style](https://stallman.org) is not cool at
  all.~~
- Add search
- ~~Add support for CSV upload~~. Not needed anymore.

## Development
I'm using vagrant for development, so is easy as:
```
git clone 
cd babel
vagrant up
```

This vagrant comes with a `bootstrap.sh` file for provisioning. It will install
all required dependencies for development using sqlite3 and MySQL. If something
is missing, please let me know! :)
