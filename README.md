# Highway-Heat-ASM-Car-Game
A low-level car racing game built in Assembly language, implementing real-time input handling, memory management, game state control, and rendering logic from scratch without external libraries.
Great—now we’ll make a **proper complete README.md** for your project that looks professional, includes your setup (COAL lab style), features, and demo video section.

You can copy-paste this directly into GitHub:

---

## 🎮 Demo

▶️ Watch Gameplay Video:
(Add your video link here, e.g. YouTube or Google Drive)

---

## 📌 Project Overview

**Highway Heat** is a low-level implementation of a car racing game that demonstrates how games can be built using pure Assembly programming.

It includes full game flow, real-time controls, multiple environments, and progressive difficulty.

---

## 🚗 Features

* 🎬 Complete game flow:

  * Intro Screen
  * Instructions Screen
  * Loading Bar
  * Gameplay

* 🎮 Real-time gameplay:

  * Lane switching controls
  * Obstacles and collision detection
  * Coins for score increase
  * Game over system

* ⚡ Progressive difficulty (speed increases with levels)

* 🌍 5 Unique Game Modes / Themes:

  * 🌞 Day Mode
  * 🌃 Night City Lights
  * 🏜️ Desert Mode (Mountains & Cacti)
  * ❄️ Snow Mode (Winter Environment)
  * 🏖️ Beach Mode (Ocean & Palms)

* 📊 Live stats:

  * Score
  * High Score
  * Distance
  * Level

* ⏸️ Pause & Resume functionality

* 🏁 Level completion & final game screen

---

## ⚙️ Technologies Used

* Assembly Language (x86)
* NASM Assembler
* DOSBox Emulator

---

## 🛠️ Setup Instructions 

### Activity 1: Setup

### Option 1 (Recommended in our Lab)

Important Note: In lab, configure already installed tools and then run your program.

Follow this link to get started:
[https://github.com/ASD0x41/Assembly-Programming-Package](https://github.com/ASD0x41/Assembly-Programming-Package)

---

### Option 2 (Manual Setup)

If the above link does not work, follow this:

* Install NASM (Assembler):
  [https://www.nasm.us/pub/nasm/releasebuilds/2.15.05/](https://www.nasm.us/pub/nasm/releasebuilds/2.15.05/)

* Required tools:

  * Notepad++
  * NASM
  * DOSBox

---

## ▶️ How to Run the Game

1. Write code in Notepad++ (`.asm` file)

2. Assemble the file using NASM:

   ```bash
   nasm -f obj file.asm
   ```

3. Link the file:

   ```bash
   tlink file.obj
   ```

4. Run inside DOSBox:

   ```bash
   file.exe
   ```

5. Use `Alt + R` (if configured) to run directly in DOSBox setup

---

## 🧠 What We Learned

* Low-level memory management
* Real-time input handling in Assembly
* Game loop design without game engines
* CPU-level execution flow understanding
* Modular design using procedures

---

## 👨‍💻 Project Type

* Course: Computer Organization & Assembly Language
* Type: Semester Project
* Platform: DOSBox
* Language: Assembly (x86)

---

## 📎 Note

This project demonstrates how a complete interactive game can be built **without any modern game engine**, purely using low-level programming concepts.

---

## ⭐ Output

A fully working car  game with multiple environments, real-time control, and progressive difficulty.

---

## 🎥 Demo Video (IMPORTANT)

Since your demo is a video:

* Upload it to YouTube (best) OR Google Drive
* Replace the link in the README under **Demo section**

---


Just tell me 👍
