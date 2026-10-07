---
type: concept
status: sprout
created: 2026-10-01
updated: 2026-10-06
course: "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/CSCI 2021 Board|CSCI 2021 Board]]"
track: C Refresher
mastery_level: "0"
prerequisites: []
used_in:
  - "[[CSCI 4061 Board]]"
evidence:
  - "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 3|Week - 3]]"
  - "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 4|Week - 4]]"
tags:
  - concept
related:
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/x86-64 and Memory Layout|x86-64 and Memory Layout]]"
---
# Bitwise Operations and Integer Representation
## One-Line Answer
==An integer in C is just a fixed-width pattern of bits, two's complement for signed values, and the bitwise operators (`& | ^ ~ << >>`) let you read or rewrite individual bits directly without touching the number's arithmetic meaning at all.==
## Start Here
For an 8-bit value, positions have place values `128 64 32 16 8 4 2 1`. The pattern `00101010` means `32 + 8 + 2 = 42`. A mask is another pattern chosen to select or change a position: `00001000` has only bit 3 set.

| Bits `a`, `b` | `a & b` | `a | b` | `a ^ b` |
|---|---:|---:|---:|
| 0, 0 | 0 | 0 | 0 |
| 0, 1 | 0 | 1 | 1 |
| 1, 0 | 0 | 1 | 1 |
| 1, 1 | 1 | 1 | 0 |

Read `&` as "keep only positions set in both," `|` as "set positions present in either," and `^` as "keep differences." These are bit-level operators, not the short-circuit logical operators `&&` and `||`.
## Mechanism
**The six operators, by what they actually do to bits, not numbers:** `&` (AND) keeps a bit only where both operands have a 1 - this is how you *read* or *clear* bits. `|` (OR) sets a bit where either operand has a 1 - this is how you *set* bits. `^` (XOR) flips a bit exactly where the operands differ - toggling. `~` (NOT) flips every bit in one operand. `<<`/`>>` shift the whole pattern left or right by N positions, discarding bits that fall off the end.
**Two named patterns do almost all the real work:**
- **Set bit N:** `x | (1 << N)`. Build a mask with a single 1 at position N (`1 << N`), OR it in - every other bit of `x` passes through unchanged because OR-ing with 0 is a no-op, and the target bit becomes 1 regardless of what it was.
- **Clear bit N:** `x & ~(1 << N)`. Build the same single-bit mask, invert it so every bit is 1 *except* position N, then AND - every other bit survives (AND with 1 is a no-op) and position N is forced to 0 regardless of what it was.
Lab04 drills exactly these two patterns directly (`x | (1<<19)` to set bit 19, `x & ~(1<<8)` to clear bit 8), then uses the same vocabulary to implement `is_even()` using *only* bitwise/logical operators for Project 2 - `!(x & 1)` reads the least-significant bit directly instead of computing `x % 2`.
**Two's complement is the representation these operators sit on top of.** An N-bit signed integer's most significant bit carries a *negative* place value (`-2^(N-1)`) instead of a positive one - everything else is the same binary place-value system. This single rule explains both commonly-memorized "tricks": negation is invert-every-bit-then-add-1 (because `~x = -x - 1` always holds in two's complement, so `~x + 1 = -x`), and the all-1s bit pattern `0xFFFFFFFF` represents `-1`, not a huge positive number, precisely because its top bit carries that negative place value.
**Worked example, verified against this course's own Project 2/3 (`bits.c`, "based on Bryant and O'Halloran's original CS:APP datalab assignment"):**
```c
int bitAnd(int x, int y) {
    return ~(~x | ~y);
}
```
This implements AND using only `~` and `|` - the allowed operator subset for that function. The mechanism is De Morgan's law applied at the bit level: `x & y == ~(~x | ~y)`, because inverting both operands, OR-ing them, then inverting the result flips every truth table row of OR into the matching row of AND. `isPower2` in the same file is a sharper example of reading structure out of a bit pattern rather than computing a value: `!(x & (x + ~0))` tests whether exactly one bit is set, because subtracting 1 from a power of two flips every bit below the single set bit, so ANDing a true power-of-two against `x - 1` always yields 0.
**Complexity/limits:** every bitwise operation is a single, constant-time CPU instruction - there is no loop hidden inside `&`/`|`/`^`/`<<`/`>>`, which is exactly why these operators are the tool of choice when a project's rules explicitly forbid arithmetic or control flow (as Project 2/3's own `bits.c` header comment does).
**Failure boundary:** shifting by a negative amount, or by an amount greater than or equal to the type's bit width (`x << 32` on a 32-bit `int`), is undefined behavior in C - the "legal ops" header comment in this course's own `bits.c` names this explicitly ("unpredictable behavior when shifting if the shift amount is less than 0 or greater than 31").
## Contrast / What It Is Not
Bitwise `&`/`|` are not the same operators as logical `&&`/`||`. `&&`/`||` short-circuit and only ever produce `0` or `1`, evaluating their operands as "zero vs. nonzero"; `&`/`|` operate bit-by-bit across the entire width of the operand and can produce any value. `5 && 2` is `1` (both nonzero); `5 & 2` is `0` (binary `101 & 010`, no shared set bits) - the two expressions look alike and mean something completely different.
## Failure Modes / Misconceptions
> [!WARNING]
> Comparing a signed `int` against an `unsigned` value silently promotes the `int` to unsigned first, per C's usual arithmetic conversions - a negative number becomes a huge positive one before the comparison runs. `int x = -1; unsigned y = 0; if (x < y)` evaluates to **false**, not true, because `-1` becomes `UINT_MAX` (all bits set, reread as unsigned) before the comparison happens. This is a real, well-known C bug class, not a hypothetical edge case - it is exactly the kind of mismatch two's complement representation makes possible when a cast (implicit or explicit) crosses the signed/unsigned boundary.
## Evidence From This Vault
- [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 3|Week - 3]] - bitwise vs. logical operators, shifts, unsigned/signed encoding, two's-complement negation (invert-and-add-1), overflow detection.
- [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 4|Week - 4]] - floating-point IEEE 754 bit layout and a deeper bitwise-operator worked-example pass.
- Project 2/3 `bits.c` (`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 2021\csci2021\proj2-code\bitwise\bits.c`) - the CS:APP datalab, the deepest bitwise-only source in the course: `bitAnd`, `isPower2`, `rotateLeft`, `replaceByte`, `floatIsEqual` all built from the six operators alone.
- Lab04 (`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 2021\csci2021\lab04-code`) - the set-bit/clear-bit masking patterns and `is_even()`.
## Flashcards
#cards/csci2021
What single bit-pattern fact explains why `~x + 1 == -x` in two's complement?::`~x` equals `-x - 1` for any two's-complement integer `x`, because inverting every bit is equivalent to computing `(-1) - x`; adding 1 to both sides gives `~x + 1 = -x`, which is exactly the "invert then add one" negation rule.
Why does `x | (1 << N)` set bit N without disturbing any other bit?::`1 << N` is a mask with a single 1 at position N and 0 everywhere else. OR-ing a 0 with any bit leaves that bit unchanged, so every position except N passes through untouched, while position N becomes 1 regardless of its prior value.
`int x = -1; unsigned y = 0;` — does `x < y` evaluate true or false, and why?::False. C's usual arithmetic conversions promote the signed `-1` to unsigned before comparing, turning it into `UINT_MAX` (all bits set, reread as unsigned) — a classic signed/unsigned comparison trap, not a typo-level bug.
Why is `~(~x | ~y)` a valid way to compute `x & y` using only `~` and `|`?::It's De Morgan's law applied bit by bit: inverting both operands, OR-ing them, then inverting the result flips every row of OR's truth table into the matching row of AND's truth table.
What does the expression `x & (x - 1)` test, and why does `isPower2` use it?::It clears the lowest set bit of `x`. If `x` is a power of two, it has exactly one set bit, so clearing it produces 0 — `!(x & (x + ~0))` (equivalent to `x & (x-1)` via two's-complement `~0 == -1`) tests exactly that condition.
