#include <QApplication>
#include <QLabel>
#include <QMainWindow>
#include <spdlog/spdlog.h>

int main(int argc, char **argv)
{
    SPDLOG_INFO("Starting ValveWizard...");

    QApplication app(argc, argv);
    QMainWindow win;
    win.setWindowTitle(QString::fromWCharArray(L"仪表选型软件"));
    win.setWindowIcon(QIcon(":/images/WindowIcon.svg"));
    auto label = new QLabel(QString::fromWCharArray(L"欢迎使用仪表选型软件"));
    win.setCentralWidget(label);
    win.show();
    return app.exec();
}