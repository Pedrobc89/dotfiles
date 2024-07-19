from typing import List
from kitty.boss import Boss

def main(args: List[str]) -> str:
    pass

from kittens.tui.handler import result_handler
@result_handler(no_ui=True)
def handle_result(args: List[str], answer: str, target_window_id: int, boss: Boss) -> None:
    opacity = 0.95 if boss.background_opacity == 1 else 1
    boss.set_background_opacity(opacity)

