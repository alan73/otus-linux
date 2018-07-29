====== Сборка ядра (vagrant + virtualbox) ======

  * установить vagrant (версии 2)
  * установить virtualbox (версии 5)
  * создать Vagrantfile со следующим содержимым (для CentOS 7)

  Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
end

  * поднять виртуалку
    * vagrant up
  * проверить состояние виртуалки
    * vagrant status
  * подсоединиться в виртуалке по ssh
    * vagrant ssh
  * скачать архив ядра
    * wget <ссылка-на-tarball-с-kernel-archives>
  * распачить архив и перейти в получившийся каталог
    * tar xvf <архив>
    * cd <архив>
  * скопировать конфиг текущего ядра
    * cp /boot/config-<версия-ядра> .config
  * привести старый конфиг к формату нового
    * make oldconfig
  * собрать
    * make
