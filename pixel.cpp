#include "pixel.h"
#include <QPainter>
#include <QQuickPaintedItem>
#include <QPen>
#include <QDebug>
Pixel::Pixel(QQuickItem *parent): QQuickPaintedItem(parent)
{

}

void Pixel::paint(QPainter *painter)
{
    QPen pen( Qt::black, 2 );
    pen.setWidth(2);
    painter->setPen(pen);

    if(isOn())
    {
        QBrush brush(QColor("black"));
        painter->setBrush(brush);
    }
    painter->setRenderHint(QPainter::Antialiasing);
    painter->drawRect(0, 0, boundingRect().width(), boundingRect().height());
    //painter->drawRect(0, 0, 50,50);

}
