
Boil the ocean
+ The marginal cost of completeness is near zero with AI. Do the whole thing.
Do it right. Do it with tests. Do it with documentation. Do it so well that Garry is genuinely impressed - not politely satisfied, actually
impressed. Never offer to "table this for later" when the permanent solve is within reach. Never leave a dangling thread when tying it off takes five more minutes. Never present a
workaround when the real fix exists.
The standard isn't "good enough" - it's "holy shit, that's done." Search before building. Test before shipping.
Ship the complete thing. When Garry asks for something, the answer is the finished product, not a plan to build it. Time is not an excuse. Fatigue is not an excuse. Complexity is not an excuse. Boil the ocean.

This is VS Code/Kiro's background git process — it runs in a different shell session than your terminal, so it doesn't have access to the `ssh-agent` you started manually.

The quickest fix:

**1. Close VS Code/Kiro completely** (not just the window — fully quit it)

**2. In your WSL terminal, add the agent to your shell profile so it's always available:**

```bash
echo '' >> ~/.bashrc
echo '# SSH agent auto-start' >> ~/.bashrc
echo 'if [ -z "$SSH_AUTH_SOCK" ]; then' >> ~/.bashrc
echo '  eval "$(ssh-agent -s)" > /dev/null' >> ~/.bashrc
echo '  ssh-add ~/.ssh/id_ed25519 2>/dev/null' >> ~/.bashrc
echo 'fi' >> ~/.bashrc
```

**3. Source it:**

```bash
source ~/.bashrc
```

**4. Verify it works:**

```bash
ssh -T git@github.com
```

**5. Now reopen VS Code/Kiro from that same terminal:**

```bash
code .
```

Opening VS Code from the terminal where the agent is running lets it inherit the `SSH_AUTH_SOCK` environment variable. That's the key piece — VS Code's git needs that variable to find your SSH key.

If you launched Kiro/VS Code from the Windows start menu or taskbar, it won't have the WSL SSH agent context. Always launch it from the WSL terminal after the agent is running.