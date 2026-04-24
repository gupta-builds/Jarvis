---
type: input
input_kind: article
status: tree
created: 2025-12-24
source_url: https://notebooklm.google.com/notebook/42d76a2f-c11d-4002-9286-1683c43d0ab0
related_progress:
  - "[[Winter Break]]"
summary: The Obsidian-Excalidraw plugin adds a hand-drawn infinite canvas inside Obsidian so you can mix sketches and markdown notes. Use it to draw flowcharts, wireframes, concept maps, and link visuals to code or documents. It speeds learning with templates, scripts, and visual summaries for clear, connected study notes.
tags:
  - input
next: "[[40_Resources/Obsidian/Data View's/Plugins]]"
---
# Obsidian-Excalidraw Plugin Tutorials

![rw-book-cover](https://notebooklm.google.com/_/static/branding/v5/og/notebook_lm_share.png)
## Highlights
- Obsidian-Excalidraw plugin ([View Highlight](https://read.readwise.io/read/01kd010g287w2m0sb6yhh1ksac))
- **Mermaid to Excalidraw** conversion, allowing you to turn Mermaid code blocks into editable visual elements ([View Highlight](https://read.readwise.io/read/01kd00zwvvp4c35ht78qxywjvd))
- use **Visual Zettelkasten**620. You can create "Atomic Visuals" for CS concepts (e.g., how a pointer works or the structure of a binary tree) and link them to your existing notes and code snippets ([View Highlight](https://read.readwise.io/read/01kd0129y18b0thvea9nmr8mrt))
- **Annotating PDFs:** If you are reading a CS textbook in PDF format, you can import specific pages, crop them to highlight a diagram or code snippet, and then annotate on top of them while maintaining a link back to the original PDF page28.... ([View Highlight](https://read.readwise.io/read/01kd013yj0mtanbr6v8g3yyt82))
- Step 1: Importing the PDF into the Canvas
  There are three primary ways to bring your textbook pages into a drawing:
  • **The Tools Panel:** Open the **Obsidian Tools Panel** (the Obsidian icon) within an Excalidraw drawing and click the **PDF button**12.
  • **The Command Palette:** Press `Ctrl/Cmd + P` and search for **"Excalidraw: Insert ANY file"** or **"Insert last active PDF page as image"** if you already have the textbook open in another pane34.
  • **Drag and Drop:** You can drag a PDF from your Obsidian File Explorer onto the canvas while holding **Shift** to embed it as an image15.
  During import, a dialog box allows you to specify exactly which pages you need (e.g., "3, 5-10")1. You can also choose to **lock the pages** upon import so they stay fixed to the background while you draw over them46.
  Step 2: Cropping and Masking Specific Content
  Once the page is on your canvas, you often only want to focus on a specific algorithm diagram or a snippet of C++ or Python code:
  1. **Open the Cropper:** Select the image, press `Ctrl/Cmd + P`, and type **"Excalidraw: Crop and mask image"**78.
  2. **Adjust the Area:** A special cropping window opens where you can drag the sides and corners to isolate the relevant part of the textbook page78.
  3. **Apply Masks (Advanced):** You can add black shapes over the image in the cropper to create transparent areas or white shapes to keep specific parts visible, which is useful for creating custom-shaped callouts for code910.
  Step 3: Annotating on Top of the PDF
  With your cropped snippet in place, you can use Excalidraw’s standard tools to build your mental model:
  • **Drawing and Linking:** Use the **arrow tool** to point to specific lines of code and the **text tool** to explain what that line does111.
  • **Highlighting:** Use a **highlighter pen** to mark important syntax112. Note that the default highlighter layer is at the bottom; if the PDF has a background color, you may need to adjust the pen's **transparency settings** (e.g., setting the hex code ending to `30`) so the color appears on top of the image1314.
  • **Creating Interactive Summaries:** You can select your annotations and the cropped PDF image, then use the **"Deconstruct Selected Elements"** script to turn that specific explanation into its own "Atomic Visual" note that can be reused in other documents1516.
  Step 4: Maintaining the Link to the Source
  The most significant advantage of this method is that you never lose the context of the full textbook:
  • **Jumping Back:** To see where a snippet came from, **double-click** the cropped image47. A menu will appear with the option to **"Open original location of the file,"** which immediately opens the PDF reader at the exact page the image was taken from717.
  • **Previewing:** If you link the cropped area into a separate Markdown note, you can **Control-hover** over that link to see a popup preview of the annotated textbook section without leaving your current note1819. ([View Highlight](https://read.readwise.io/read/01kd01hr873q85nvzjykxcw7f6))
- Step 1: Importing the PDF into the Canvas
  There are three primary ways to bring your textbook pages into a drawing:
  • **The Tools Panel:** Open the **Obsidian Tools Panel** (the Obsidian icon) within an Excalidraw drawing and click the **PDF button**12.
  • **The Command Palette:** Press `Ctrl/Cmd + P` and search for **"Excalidraw: Insert ANY file"** or **"Insert last active PDF page as image"** if you already have the textbook open in another pane34.
  • **Drag and Drop:** You can drag a PDF from your Obsidian File Explorer onto the canvas while holding **Shift** to embed it as an image15.
  During import, a dialog box allows you to specify exactly which pages you need (e.g., "3, 5-10")1. You can also choose to **lock the pages** upon import so they stay fixed to the background while you draw over them46.
  Step 2: Cropping and Masking Specific Content
  Once the page is on your canvas, you often only want to focus on a specific algorithm diagram or a snippet of C++ or Python code:
  1. **Open the Cropper:** Select the image, press `Ctrl/Cmd + P`, and type **"Excalidraw: Crop and mask image"**78.
  2. **Adjust the Area:** A special cropping window opens where you can drag the sides and corners to isolate the relevant part of the textbook page78.
  3. **Apply Masks (Advanced):** You can add black shapes over the image in the cropper to create transparent areas or white shapes to keep specific parts visible, which is useful for creating custom-shaped callouts for code910.
  Step 3: Annotating on Top of the PDF
  With your cropped snippet in place, you can use Excalidraw’s standard tools to build your mental model:
  • **Drawing and Linking:** Use the **arrow tool** to point to specific lines of code and the **text tool** to explain what that line does111.
  • **Highlighting:** Use a **highlighter pen** to mark important syntax112. Note that the default highlighter layer is at the bottom; if the PDF has a background color, you may need to adjust the pen's **transparency settings** (e.g., setting the hex code ending to `30`) so the color appears on top of the image1314.
  • **Creating Interactive Summaries:** You can select your annotations and the cropped PDF image, then use the **"Deconstruct Selected Elements"** script to turn that specific explanation into its own "Atomic Visual" note that can be reused in other documents1516.
  Step 4: Maintaining the Link to the Source
  The most significant advantage of this method is that you never lose the context of the full textbook:
  • **Jumping Back:** To see where a snippet came from, **double-click** the cropped image47. A menu will appear with the option to **"Open original location of the file,"** which immediately opens the PDF reader at the exact page the image was taken from717.
  • **Previewing:** If you link the cropped area into a separate Markdown note, you can **Control-hover** over that link to see a popup preview of the annotated textbook section without leaving your current note1819. ([View Highlight](https://read.readwise.io/read/01kd01j327tpy7wp1ryxmzw7fs))
