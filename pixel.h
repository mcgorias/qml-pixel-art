#ifndef PIXEL_H
#define PIXEL_H

#include <QQuickPaintedItem>

class Pixel : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(bool isOn READ isOn WRITE setOn NOTIFY stateChanged)

public:
    Pixel(QQuickItem *parent = 0);
    void paint(QPainter *painter);

    bool isOn() const {return _IsOn;}
    void setOn(bool on){_IsOn = on;}

    void mousePressEvent(QMouseEvent *event) {
      QQuickItem::mousePressEvent(event);
      event->accept();
      QPointF pos = event->localPos();
      qDebug() << "mousePressEvent" << pos.x() << pos.y();
    }
    void hoverMoveEvent(QHoverEvent* event) {
            QQuickItem::hoverMoveEvent(event);
            qDebug() << event->pos();
        }

signals:
    bool stateChanged();

public slots:

protected:
    bool _IsOn=false;
};

#endif // PIXEL_H
