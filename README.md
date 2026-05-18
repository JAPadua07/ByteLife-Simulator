# Byte

An educational visual novel RPG built in **GameMaker Studio 2**.

You play as a student attending a 3-day computer science class under the strict Professor Kei. Each day you answer quiz questions, manage your stats, and make decisions during break time that shape who you become by the end.

---

## Gameplay Overview

The game spans **3 in-game days**:

- **Day 1** — Computer Hardware (Motherboard, CPU, RAM, SSD, GPU, PSU, Cooling Fan, BIOS)
- **Day 2** — PHP Programming (echo, variables, conditionals, arrays, loops, functions, POST/GET, mysqli)
- **Day 3** — Final Exam covering both days

Each day follows this loop:

1. Professor Kei delivers a lesson via dialogue
2. A quiz question appears with 4 multiple-choice answers
3. After every 3 questions, a **break** occurs where you choose what to do
4. At the end of the day, you sleep and restore your energy

---

## Stats

| Stat | Description |
|------|-------------|
| **INT** (Intelligence) | Increased by studying during breaks. Affects how confidently you answer. |
| **STR** (Strength) | Increased by training at the park. Determines your ending. |
| **Mood** | Affected by correct/wrong answers and break choices. Low mood causes you to skip exam questions. |
| **Energy** | Spent on break activities. Resets to 3 each morning after sleep. |

---

## Break Activities

During each break you choose one of the following:

| Activity | Energy Cost | Effect |
|----------|-------------|--------|
| **Study** | −1 | Bonus quiz question; INT +2 (correct) or INT +1 (wrong) |
| **Train** | −1 | Complete 3 exercises at the park; STR +1 |
| **Play** | −1 | Relax; Mood +1 |
| **Rest** | 0 | Forced when energy = 0; no stat change |

---

## Endings

Your ending is determined by your **STR** stat at the end of Day 3:

| Condition | Ending |
|-----------|--------|
| STR ≤ 2 | **Bullied** — JB takes your notes. You don't have the strength to refuse. |
| STR > INT and STR ≥ 4 | **Stand Your Ground** — You face JB and say no. |
| Everything else | **Normal** — A quiet, uneventful wrap-up with your classmate. |

---

## Project Structure

```
byte/
├── objects/
│   ├── obj_controller/         # Central game state machine
│   ├── obj_dialogue_box/       # Dialogue rendering and advance logic
│   ├── obj_character_display/  # Left/right character sprite display
│   ├── obj_break_choice/       # Break activity selection overlay
│   ├── obj_park_minigame/      # Training mini-game manager
│   ├── obj_btn_choice1–4/      # Multiple choice answer buttons
│   ├── obj_mood_display/       # HUD mood icon
│   ├── obj_visual_aid/         # Contextual sprite during lessons
│   ├── charSel_*/              # Character selection screen objects
│   └── moosic/                 # Background music controller
├── scripts/
│   ├── scr_load_phase/         # Main phase/state loader
│   └── scr_exercise_complete/  # Handles park exercise completion
├── rooms/
│   ├── Title                   # Main menu
│   ├── CharSel                 # Character selection
│   ├── Loading                 # Transition screen
│   ├── Class                   # Primary gameplay room
│   ├── Park                    # Training mini-game
│   ├── Library                 # Study break
│   └── Bed                     # Day-end sleep transition
└── sprites/                    # All game art assets
```

---

## How to Run

1. Open `byte.yyp` in **GameMaker Studio 2**
2. Press **F5** to run in debug mode, or **F6** to build

> Requires GameMaker Studio 2 (any recent version). No external dependencies.

---

## Known Issues & Fixes Applied

| ID | Issue | Status |
|----|-------|--------|
| BUG-001 | Choosing Train on Break 1 restarted the game from Day 1 due to `obj_controller` being placed in the Park room and re-running its Create event | **Fix:** Make `obj_controller` persistent and remove it from non-Class rooms |
| BUG-002 | Completing training gave no STR feedback dialogue, unlike Study which shows INT gain | **Fixed** — `scr_exercise_complete` now routes through `break_train_done_{id}` phase |
| BUG-003 | JB's NPC sprite index mapped to `ProfK` (placeholder) | **Fixed** — updated `npc_sprites[5]` to `BgB1` |

---

## Character Selection Gate

The game will not proceed from the Character Selection screen unless:
- A character (Boy or Girl) has been selected
- A name has been entered in the name field

An error message will appear and the name field outline will turn red if either condition is unmet.

---

## Built With

- [GameMaker Studio 2](https://gamemaker.io)
- GML (GameMaker Language)
