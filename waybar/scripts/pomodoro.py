
import argparse
import json
import os
import time
from datetime import datetime, timedelta
import subprocess

STATE_FILE = os.path.join(os.path.expanduser("~"), ".pomodoro_state.json")

def get_state():
    if not os.path.exists(STATE_FILE):
        return {"status": "stopped", "end_time": None, "duration": 25, "type": "work"}
    with open(STATE_FILE, "r") as f:
        return json.load(f)

def save_state(state):
    with open(STATE_FILE, "w") as f:
        json.dump(state, f)

def start_timer(duration, timer_type):
    timer_type_map = {
        "work": "Trabalho",
        "short_break": "Pausa Curta",
        "long_break": "Pausa Longa"
    }
    translated_timer_type = timer_type_map.get(timer_type, timer_type.capitalize())
    end_time = datetime.now() + timedelta(minutes=duration)
    save_state({"status": "running", "end_time": end_time.isoformat(), "duration": duration, "type": timer_type})
    print(f"{translated_timer_type} iniciado por {duration} minutos.")

def stop_timer():
    save_state({"status": "stopped", "end_time": None, "duration": 25, "type": "work"})
    print("Timer parado.")

def get_status():
    state = get_state()
    if state["status"] == "running":
        end_time = datetime.fromisoformat(state["end_time"])
        remaining = end_time - datetime.now()
        if remaining.total_seconds() <= 0:
            timer_type = state.get("type", "work")
            if timer_type == "work":
                print("Trabalho: 00:00")
                subprocess.run(["notify-send", "Pomodoro", "Seu tempo de trabalho acabou! Iniciando pausa de 5 minutos."], check=False)
                start_timer(5, "short_break")
            elif timer_type == "short_break" or timer_type == "long_break":
                print("Descanso: 00:00")
                subprocess.run(["notify-send", "Pomodoro", "Seu tempo de descanso acabou! Iniciando trabalho de 25 minutos."], check=False)
                start_timer(25, "work")
        else:
            minutes, seconds = divmod(int(remaining.total_seconds()), 60)
            timer_type = state.get("type", "work")
            if timer_type == "work":
                icon = "뽀"
            elif timer_type == "short_break":
                icon = "쉬"
            elif timer_type == "long_break":
                icon = "장"
            else:
                icon = ""
            if timer_type == "work":
                prefix = "Trabalho"
            elif timer_type == "short_break" or timer_type == "long_break":
                prefix = "Descanso"
            else:
                prefix = "Timer" # Fallback
            print(f'{prefix}: {minutes:02d}:{seconds:02d}')
    else:
        # Timer está parado
        print("Iniciar")


def main():
    parser = argparse.ArgumentParser(description="CLI Timer para Waybar")
    subparsers = parser.add_subparsers(dest="command")

    start_parser = subparsers.add_parser("start", help="Inicia um novo timer.")
    start_parser.add_argument("--work", type=int, default=25, help="Duração do trabalho em minutos.")
    start_parser.add_argument("--short-break", type=int, default=5, help="Duração da pausa curta em minutos.")
    start_parser.add_argument("--long-break", type=int, default=15, help="Duração da pausa longa em minutos.")

    subparsers.add_parser("stop", help="Para o timer atual.")
    subparsers.add_parser("status", help="Obtém o status atual do timer para Waybar.")

    args = parser.parse_args()

    if args.command == "start":
        state = get_state()
        if state["status"] == "running":
            print("Timer já está rodando.")
        else:
            start_timer(args.work, "work")
    elif args.command == "stop":
        stop_timer()
    elif args.command == "status":
        get_status()
    else:
        get_status()

if __name__ == "__main__":
    main()

