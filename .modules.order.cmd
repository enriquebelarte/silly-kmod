cmd_/home/enrique/Proyectos/silly-kmod/modules.order := {   echo /home/enrique/Proyectos/silly-kmod/silly.ko; :; } | awk '!x[$$0]++' - > /home/enrique/Proyectos/silly-kmod/modules.order
