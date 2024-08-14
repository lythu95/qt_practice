
#include <QtGui/QGuiApplication>
#include <QtQuick/QQuickView>
#include <QtQml/QQmlEngine>
#include <QtQml/QQmlContext>
#include <QQmlApplicationEngine>
#include <QDebug>

int main(int argc, char *argv[])
{
    //QLoggingCategory::setFilterRules(QStringLiteral("qt.bluetooth* = true"));
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication application(argc, argv);

    // QQmlApplicationEngine engine;
    // engine.load(QUrl(QStringLiteral("qrc:/qml/telegram.qml")))

    const QString mainQmlApp = QStringLiteral("qrc:/qml/telegram.qml");
    QQuickView view;
    // view.engine()->rootContext()->setContextProperty(QStringLiteral("targetUuid"), uuid);
    view.setSource(QUrl(mainQmlApp));
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    QObject::connect(view.engine(), SIGNAL(quit()), qApp, SLOT(quit()));
    view.setGeometry(QRect(100, 100, 500, 240));
    // hide title bar in QML
    // view.setFlags(Qt::Window | Qt::FramelessWindowHint);
    view.show();
    return application.exec();
}
