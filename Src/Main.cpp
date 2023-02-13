#include <QApplication>
#include <QLabel>
#include <QMainWindow>
#include <spdlog/spdlog.h>

int main(int argc, char **argv)
{
    SPDLOG_INFO("Starting ApplicationName...");

    QApplication app(argc, argv);
    QMainWindow win;
    win.setGeometry(100, 100, 400, 300);
    win.setWindowTitle(QString::fromWCharArray(L"ApplicationName"));
    win.setWindowIcon(QIcon(":/images/WindowIcon.svg"));
    auto label = new QLabel(QString::fromWCharArray(L"Welcome to ApplicationName"));
    label->setAlignment(Qt::AlignCenter);
    win.setCentralWidget(label);
    win.show();
    return app.exec();
}