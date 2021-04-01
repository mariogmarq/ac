#!/bin/bash
#Órdenes para el Gestor de carga de trabajo:
#1. Asigna al trabajo un nombre
#SBATCH --job-name=listado1
#2. Asignar el trabajo a una partición (cola) 
#SBATCH --partition=ac
#2. Asignar el trabajo a un account
#SBATCH --account=ac

#Obtener información de las variables del entorno del Gestor de carga de trabajo:
echo "Id. usuario del trabajo: $SLURM_JOB_USER"
echo "Id. del trabajo: $SLURM_JOBID"
echo "Nombre del trabajo especificado por usuario: $SLURM_JOB_NAME"
echo "Directorio de trabajo (en el que se ejecuta el script): $SLURM_SUBMIT_DIR"
echo "Cola: $SLURM_JOB_PARTITION"
echo "Nodo que ejecuta este trabajo:$SLURM_SUBMIT_HOST"
echo "Nº de nodos asignadosal trabajo: $SLURM_JOB_NUM_NODES"
echo "Nodos asignados al trabajo: $SLURM_JOB_NODELIST"
echo "CPUspor nodo: $SLURM_JOB_CPUS_PER_NODE"
#Instrucciones del script para ejecutar código:
echo -e "\n 1. Ejecución listado1:\n"


echo -e "\n\nlistado1:\n"
for ((P=16384;P<=67108864;P=P*2))
do
	echo -e "\n tam: $P"
	./listado1 $P
	
done

echo -e "\n\nsp-OpenMP-for:\n"
for ((P=16384;P<=67108864;P=P*2))
do
	echo -e "\n tam: $P"
	./sp-OpenMP-for $P
	
done

echo -e "\n\nsp-OpenMP-sections:\n"
for ((P=16384;P<=67108864;P=P*2))
do
	echo -e "\n tam: $P"
	./sp-OpenMP-sections $P
	
done
