---
type: input
status: seed
created:
input_kind: transcript
source_url:
related_progress: []
tags:
  - transcript
next:
---
# Writing - 1 Video Transcript

**Captured:** 2026-10-02
**Source:**

## Raw Transcript

Paste the untouched transcript below, inside the fence. Do not edit, clean, or summarize here — this file is the raw capture. Summarization happens in the linked brief once `/transcript-to-brief` runs.

```
[00:00:38] How's it going, everyone?
[00:00:39] My name is Logan Kilpatrick.
[00:00:40] I'm part of the Google DeepMind team.
[00:00:41] Welcome back to Release Notes.
[00:00:42] Today we're here
[00:00:43] in the Gemini Robotics lab,
[00:00:45] with Carolina, Stuart, Kanishka, and Jie.
[00:00:48] We're talking about the new embodied reasoning model and actually
[00:00:52] the whole suite of Gemini Robotics launches that are coming out.
[00:00:56] So I'm super excited. I have a million questions.
[00:00:58] We were talking off camera.
[00:00:59] But Carolina, maybe you can kick us off
[00:01:01] with sort of the headline for this moment.
[00:01:04] And then we can actually take a step back after that and
[00:01:06] talk about the arc, maybe, across all the work that it's taken to get here.
[00:01:11] And we'll get to see cool robots, which I'm excited about.
[00:01:14] - Yeah, definitely.
[00:01:15] What we're building here is the intelligence layer to power
[00:01:18] any robot to do a broad range of useful tasks.
[00:01:22] And we've been building towards this moment for a very long time, actually.
[00:01:25] Our team has been working
[00:01:26] towards general-purpose robotics
[00:01:28] since the inception of the team.
[00:01:30] And we had a long history of always thinking,
[00:01:32] how do we solve the problem
[00:01:34] from first principles in a way
[00:01:36] that doesn’t just take shortcuts
[00:01:39] and tries to solve the entire problem?
[00:01:41] And so the entire problem
[00:01:42] really means infusing
[00:01:43] a robot with human-level intelligence, right?
[00:01:46] So that it can understand the environment as you and I can,
[00:01:50] so that it can reason about what it means to complete a task.
[00:01:54] And then it can actually take action with all
[00:01:56] the dexterity that us humans have and take for granted.
[00:01:59] -Yeah. -So that's the general goal.
[00:02:01] - I love that.
[00:02:02] And the actual release that we're talking about today
[00:02:06] is the new package of Gemini Robotics 2 models,
[00:02:11] starting with the ER model, but a bunch of other stuff as well.
[00:02:15] Do you want to talk through the different models,
[00:02:17] the suite of models that are becoming available?
[00:02:19] - Yeah, so Gemini Robotics 2 essentially
[00:02:22] is bringing whole-body intelligence to robots.
[00:02:24] So what that means is that we are enabling
[00:02:28] a model that can understand where the entire, every part of the robot
[00:02:32] is in space, and it can reason about doing more complicated tasks.
[00:02:35] So, imagine that you get in your closet and you're
[00:02:37] trying to clean it up and put away all your clothes and your shoes.
[00:02:41] That requires you to move your body in all kinds of ways, avoid obstacles,
[00:02:45] reach things high, pick things from the floor,
[00:02:47] this is something that we could not really do before
[00:02:50] in a way that understands what's going on.
[00:02:53] We literally put the robot in a garage and ask it,
[00:02:56] "Can you please clean up this garage?"
[00:02:57] Right? And then—
[00:02:58] - Is that the real prompt in those examples?
[00:03:00] It's literally "Please clean my garage?"
[00:03:03] - Yeah, you'll get to see it. Inspired by our own needs, I think.
[00:03:07] - I love it.
[00:03:08] - So, then the robot needs to reason about what
[00:03:09] does it mean to clean up a garage?
[00:03:11] It needs to think about,
[00:03:12] "Oh, I'm going to put all the cleaning supplies in the same place."
[00:03:15] It needs to be able to
[00:03:16] put things high, up high.
[00:03:18] If something falls on the ground, it has to understand that,
[00:03:20] and then go pick it up, and then put it away.
[00:03:23] So that's one of the big things that we're bringing in this release.
[00:03:26] The second thing that we worked significantly on,
[00:03:29] and we still have a lot more work to do, is dexterity.
[00:03:32] So, again, us humans take for granted
[00:03:34] this really dexterous hands that we have,
[00:03:37] but pretty much everything you do every day requires dexterity.
[00:03:40] And that means folding things, opening doors,
[00:03:44] just picking anything that will fall out of your hands.
[00:03:48] And so, dexterity is an area that we worked on a lot.
[00:03:51] And if you just, again, if you just get yourself, in the morning, coffee,
[00:03:55] that is actually a pretty dexterous task.
[00:03:57] - Yeah. - And one thing to know is that
[00:03:59] because we're building this intelligence layer across robots,
[00:04:02] is we definitely work a lot on making this work really well
[00:04:05] on humanoids, but we also bring other robots that we're controlling.
[00:04:09] So, the one that is right behind you is actually
[00:04:12] our Franka Duo and it has two Franka arms.
[00:04:15] And we also control with the exact same model,
[00:04:17] this robot in order to do pretty dexterous things with those grippers,
[00:04:20] like pack things neatly.
[00:04:22] So, that's another form of dexterity.
[00:04:24] And then the third thing that we bring in is what we call
[00:04:27] multi-robot collaboration,
[00:04:29] which is different robots have different capabilities, right?
[00:04:32] And what we're doing here is that you have, you're bringing the robot
[00:04:35] the intelligence to know what it needs to do to complete a task,
[00:04:38] but also the understanding that it can call
[00:04:41] other robots to accelerate the task,
[00:04:43] or to do things in parallel, and do things faster.
[00:04:47] So, those are roughly the three things that we're doing in this release.
[00:04:50] - I'm excited for this. I have a home robot vacuum,
[00:04:53] and then I have another robot that I have ordered.
[00:04:55] Hopefully it'll be powered by Gemini Robotics 2,
[00:04:58] that doesn’t vacuum but does a bunch of other stuff.
[00:05:00] And so I feel like this is actually going to be—
[00:05:02] I did not think about this today, but I was thinking to myself,
[00:05:04] I was like, can I get the one to sort of carry the other one around,
[00:05:07] and go deploy the robot to go do certain tasks?
[00:05:11] But ideally they could just communicate as robots together
[00:05:14] and get the work done, which is super interesting.
[00:05:18] Maybe we can also talk about the arc to get here, and obviously,
[00:05:22] this is the second Gemini Robotics model,
[00:05:24] but is there other things that are worth--
[00:05:26] Obviously, Google's been doing a lot of robotic stuff.
[00:05:29] DeepMind, maybe, I actually don't know.
[00:05:31] Maybe also had a bunch of robotic stuff, but you can talk about any of
[00:05:34] the research and the arc to get to this launch moment?
[00:05:39] - Yeah, I mean, it's been a long path.
[00:05:40] I think many of us have been here
[00:05:42] also for a while and have seen all of these steps through.
[00:05:45] But yeah, I mean, we've always, from the beginning, like I said,
[00:05:47] we were really thinking about general-purpose robotics
[00:05:50] before, I think, the field really realized that was feasible.
[00:05:53] And so we've done a few iterations where we've brought
[00:05:58] techniques that now are table stakes for the community.
[00:06:00] So for example, we first introduced reinforcement learning,
[00:06:05] to learning simulation, how to control whole robots, right?
[00:06:10] So you see a lot of robots today, dancing and doing acrobatics.
[00:06:13] Those robots are actually using those techniques in order to move the robots
[00:06:18] in a way that feels stable and that can mimic a particular sequence.
[00:06:22] We've also shown what's possible when it comes to bringing
[00:06:25] LLMs and VLMs, when it comes to planning for robots.
[00:06:28] Before that effort, basically, robots did not understand semantics.
[00:06:32] They did not understand our world.
[00:06:34] They did not know what you meant when you say,
[00:06:35] "Bring me a cup." - Yeah.
[00:06:37] - Right? You actually had to say, "No,
[00:06:38] bring me that object at position X Y Z, in space."
[00:06:42] So, that was one clear breakthrough.
[00:06:44] We also introduced transformers to robotics, and that shifted the field
[00:06:48] into this era of data-driven robotics, where you now had to just
[00:06:52] collect a lot of data, and teach the robot how to do many different tasks.
[00:06:56] And then introduce even the concept of a VLA,
[00:06:59] which is a new type of foundation model called
[00:07:01] Vision Language Action (VLA) model,
[00:07:03] that essentially enables robots to understand natural language
[00:07:06] and visual input and then directly control them in a way that is general.
[00:07:09] So, this VLA type of foundation model
[00:07:13] is again, adopted in the community.
[00:07:15] And then we've also shown what's possible when it comes to dexterity.
[00:07:18] I think many of us did not really think that it
[00:07:19] was possible to tie shoelaces, for example, in our careers.
[00:07:23] And that's something that, today, people tie shoelaces,
[00:07:26] they fold their laundry.
[00:07:28] These are things that we showed that was possible.
[00:07:29] And I think all of that has come together
[00:07:33] towards this Gemini Robotics models that we introduced last year.
[00:07:36] And so last year, what we did was we brought all of the power of Gemini's
[00:07:40] multimodal world understanding, combined with those techniques
[00:07:44] in order to bring essentially Gemini's intelligence to robots.
[00:07:48] And all it is, is that we
[00:07:50] enable Gemini to also think about moving robots.
[00:07:54] So, we add actions as a modality in Gemini.
[00:07:56] And so that essentially enables Gemini to understand when you ask it to
[00:08:01] turn around this, it understands what it means to move around the bottle.
[00:08:06] Or if you ask it to do something more complex,
[00:08:08] pick up all the things that are pink,
[00:08:10] then it understands what that means.
[00:08:12] So, that's essentially what Gemini Robotics is.
[00:08:14] And then we continuously improve it.
[00:08:15] And Gemini Robotics 2 is a pretty big
[00:08:18] step function with respect to our previous one.
[00:08:20] - I love that.
[00:08:21] - I think, yeah, our team
[00:08:22] aggressively thinks about this problem
[00:08:23] from a frontier model, lab perspective.
[00:08:26] So, really leveraging,
[00:08:27] you don't have to
[00:08:28] solve robotics from scratch.
[00:08:29] There's all this world understanding
[00:08:31] in these big models.
[00:08:32] So, the idea is how do you
[00:08:33] latch on to that understanding
[00:08:35] and then use the robot for useful things?
[00:08:38] So, you've had this history of using data as a scaling paradigm, but now,
[00:08:41] it's more like these frontier intelligent things,
[00:08:45] how do you hook up this
[00:08:46] physical thing to those models and then
[00:08:48] kind of bootstrap robotics from those?
[00:08:50] - And what ends up being the limitation in practice?
[00:08:53] Because I'm thinking, for example, I've seen the demos of the robots
[00:08:56] dancing and all this crazy stuff, and doing backflips, which I cannot do.
[00:08:59] But then you also see
[00:09:00] for AI agents, the meme canonical demo is like booking travel.
[00:09:05] And I feel like for robots, it's folding laundry.
[00:09:09] But yet, it feels like also maybe the robots cannot actually fold laundry yet.
[00:09:12] Maybe that's not true. Maybe Gemini Robotics 2 closes that gap.
[00:09:16] But I'm curious, there's so much understanding
[00:09:19] and intelligence baked into the model.
[00:09:22] What's the place to actually hill climb
[00:09:25] to get to the place where you start to see
[00:09:28] robots folding laundry successfully in most cases?
[00:09:31] Or actually are we already there?
[00:09:33] And maybe I'm not fully calibrated on model progress in this regard.
[00:09:37] - So, there is a lot of
[00:09:38] progress in the last ten years.
[00:09:39] So, one thing that you mentioned
[00:09:40] is locomotion or whole body control
[00:09:43] has reached a new height
[00:09:44] where you see the humanoid robots
[00:09:46] that can backflip and
[00:09:47] doing very agile motions.
[00:09:49] Also, our team pioneered a research called reinforced learning
[00:09:53] and sim-to-real transfer that makes all those things happen.
[00:09:56] So, it seems that the locomotion is nearly a solved problem.
[00:09:59] What's remaining is actually a very hard problem, is dexterous manipulation,
[00:10:03] which is that how can you use a hand or grippers to interact
[00:10:06] with all these objects in order to accomplish the task in your daily life?
[00:10:10] - Yeah.
[00:10:11] - The reason that's very complicated is because it's very contact-rich.
[00:10:15] So you need to think about a lot of contact points
[00:10:19] on the object in order to move them in a desirable way.
[00:10:22] And to control your hand, it has over twenty degrees of freedom.
[00:10:27] So, you need to coordinate all these joints and muscles
[00:10:29] in order to do those tasks.
[00:10:31] And all these things are way, way harder than locomotion problems.
[00:10:35] You only need to control yourself, on usually a flat ground,
[00:10:38] or slightly perturbed ground.
[00:10:40] So, dexterous manipulation with all these different objects
[00:10:43] in real world is really an unsolved problem for robotics for now.
[00:10:47] - Interesting.
[00:10:48] Where is the quality gain come from these days?
[00:10:51] Is it we just get more data or it's
[00:10:54] new techniques or just scaling up general purpose models?
[00:10:56] How do we actually,
[00:10:58] it's an unsolved problem, but where do we make
[00:11:01] progress on actually solving it?
[00:11:03] - I think data is a big part of it.
[00:11:05] As Jie mentioned, we're missing this internet of physical interaction data.
[00:11:09] As I open this cup, there's a sequence of,
[00:11:11] I make a move and the environment moves in response to it.
[00:11:15] So, this kind of sequence of interaction with the physical world,
[00:11:18] there's no internet of this.
[00:11:19] So, I think data is a key part to this physical AGI component
[00:11:24] that we have not unlocked yet.
[00:11:25] And that is an open question, how do you collect it?
[00:11:28] Data quality really matters here.
[00:11:30] So, I think, yeah, just how do we collect the scaled
[00:11:33] digital version of physical interactions is an open thing.
[00:11:35] And we're basically hill climbing that
[00:11:38] as one of the big levers on unlocking physical AGI.
[00:11:41] - Do we not have the ability to, and I'm guessing, actually,
[00:11:43] one of the threads that I'm always talking to folks about is
[00:11:47] back to this building on the world model, this interop between main Gemini
[00:11:50] and some of these domain-specific cases.
[00:11:53] Can you not take a video of someone unscrewing the water bottle and intuit
[00:11:59] some of this data and get some of it out of those types of,
[00:12:02] and it feels like there's a richness in that type of data.
[00:12:06] Maybe there's not richness in the labeled format
[00:12:08] that we actually need to make progress,
[00:12:11] but have we gotten closer to being able to actually leverage
[00:12:14] some of the existing non-robotics data to do these tasks?
[00:12:18] - I think if you look at the data progression
[00:12:20] in the last couple of years,
[00:12:21] so, people usually talk about this data pyramid.
[00:12:24] On the top of that is teleoperation data.
[00:12:27] These are the data where you move some controllers,
[00:12:31] and the robot is going to move accordingly,
[00:12:33] so, this is called teleoperation.
[00:12:35] These data are very useful because you get all the signals,
[00:12:38] basically how you should move the robot in different scenarios
[00:12:41] to train the robot.
[00:12:42] But, these data are not very scalable because teleoperation is very costly.
[00:12:46] You need a human there, you need a robot in the loop, and so on.
[00:12:49] And people say, "Maybe we need something more scalable."
[00:12:52] And people think about wearable device.
[00:12:54] There is something called the UMI, which is in the academic world,
[00:12:58] where people build these wearable grippers so that human
[00:13:03] can collect the data without the robot in the loop.
[00:13:05] - Pretend you're a robot in your house,
[00:13:07] and do stuff all day.
[00:13:08] - I've seen some of these videos, it's interesting.
[00:13:11] - Then, those data becomes really scalable.
[00:13:13] But the problem is human and robots are different.
[00:13:16] There is this embodiment gap you need to cross, right?
[00:13:19] And down beneath it,
[00:13:20] maybe the widest base is really egocentric human data.
[00:13:24] Basically, human— you take a video of human doing things,
[00:13:26] then hopefully we can learn from those.
[00:13:28] But again, you don't know how much actuation
[00:13:32] or how much muscle force you do with each movement of humans.
[00:13:36] So you are missing a very important label of the actions.
[00:13:40] At the same time, as I mentioned, that human robots are different,
[00:13:43] so it's the hardest data to leverage.
[00:13:46] Of course, we are making progress on leveraging
[00:13:48] all the entire pyramid of data, but we are not quite there yet.
[00:13:52] - Yeah, I'm thinking about in the context of mainline Gemini,
[00:13:55] for some of these use cases where like the models don't really work,
[00:13:58] you start to see like 1,000 high-quality trajectories,
[00:14:01] it makes a massive difference in overall quality of the model.
[00:14:04] Do you see that type of, again, without getting into the specifics,
[00:14:08] is it low-hanging fruit, free hill climbing everywhere?
[00:14:11] Or is it really you actually need the reason tele--
[00:14:14] because I'm thinking, it's Google.
[00:14:15] We could we could go get 1,000 tele-operated,
[00:14:20] examples of people going in, collecting that data.
[00:14:22] But you're saying we need it would be
[00:14:24] the scales of millions of millions in order to get any...
[00:14:27] Interesting.
[00:14:28] - This was Gemini,
[00:14:29] which is pre-trained on the internet, right?
[00:14:30] So there's a lot of nice biases there for language and vision stuff.
[00:14:34] - Yeah.
[00:14:35] - But whenever we add this physical thing into the model,
[00:14:38] it doesn’t play well with the pre-trained stuff.
[00:14:40] So in fact, that's one of the reasons why we have
[00:14:42] our Gemini Robotics model is because it is hard to upstream something
[00:14:45] without killing all the other generational properties of the model.
[00:14:48] So,
[00:14:48] this physical thing, our datasets are so tiny compared to the other
[00:14:51] digital token sets, that they don't play well yet.
[00:14:54] So, either we scale these up and they start playing well,
[00:14:56] or there's some other way we can connect them.
[00:14:58] But it's still an unsolved problem.
[00:14:59] That's why you don't see these frontier models
[00:15:01] directly controlling robots.
[00:15:03] - Yeah. You inherit things like natural language understanding,
[00:15:06] visual understanding.
[00:15:07] I don't have to pick up a bottle that is black and white and different shapes,
[00:15:12] like all of that generalization, which we now take for granted.
[00:15:15] - That's true. I did not even think about that.
[00:15:16] - But before you had to collect every single object.
[00:15:19] So, we do get some generalization,
[00:15:21] but I think the big part that is missing
[00:15:23] is really understanding motion.
[00:15:25] And motion is not something that you inherit from Gemini today, right?
[00:15:28] Motion is something that we have to teach Gemini.
[00:15:31] - Or understand force.
[00:15:32] - Or force. - Interactions.
[00:15:33] These are the things that I think Gemini is not trained on.
[00:15:36] - Yeah. I'm also super curious, there's obviously such a distribution
[00:15:40] of the actual robotic use cases.
[00:15:41] And I'm curious, for us, and for Gemini Robotics,
[00:15:44] has there been a focus?
[00:15:45] Is it like we want to enable home robotic use cases and we see traction?
[00:15:51] Obviously, there's a huge amount of industrial automation stuff happening.
[00:15:54] Is there-- I know, Carolina, you said we want general purpose robots.
[00:15:57] And so theoretically you could do all of those things,
[00:15:59] but I'm curious, actually,
[00:16:00] if there's been-- is it jagged as far as progress or capability,
[00:16:05] or things that are actually working more today versus not?
[00:16:10] - Yeah, there is, I think, two answers to that question.
[00:16:12] I would say in the capability front, we certainly believe that you want to
[00:16:16] be able to solve a broad range of tasks, and actually by going narrow,
[00:16:20] you're going to build a policy that is going to be a lot more brittle.
[00:16:22] It might work better in that environment, but the minute you change
[00:16:25] anything about the environment, things are going to start to go wrong.
[00:16:28] So, our approach is certainly don't compromise on,
[00:16:31] you're trying to solve general-purpose tasks,
[00:16:33] and understand general-purpose motion,
[00:16:35] and handle a broad range of different objects.
[00:16:37] I would say in terms of deployment, I think of it a bit differently, right?
[00:16:40] I think it's much more likely that these robots are going to be useful
[00:16:44] in environments like industrial environments that are semi-structured,
[00:16:47] that have safety pretty much under control, and that you can get
[00:16:53] a lot of real-world experience
[00:16:54] of what it means to launch these models.
[00:16:56] And then from there, I imagine that we would go to things
[00:16:58] like retail and other environments that are also
[00:17:01] starting to get into human-centric spaces, but they're less vulnerable
[00:17:05] than in the middle of your house, with your kids and your pets.
[00:17:08] - You're raining on my Q4 2026 home robot orders right now.
[00:17:13] I'm waiting.
[00:17:14] I've written off all of my chores for 2026,
[00:17:17] as soon as I start getting some of these robots delivered.
[00:17:20] So it's not—
[00:17:21] - Yeah, I mean, there's plenty of people out there
[00:17:22] that think that they're going to go home first.
[00:17:24] And I think there's, the appealing thing there
[00:17:26] is that home first requires that diversity, that generalization.
[00:17:30] So it forces that problem, it makes it very front and center.
[00:17:34] - And you have to check, I think we always found
[00:17:36] it's the opposite where, if you do train on this one narrow thing,
[00:17:39] as yeah, it becomes worse.
[00:17:41] So having it collect on many different diverse cases,
[00:17:44] just helps the general intelligence of it.
[00:17:46] So yeah, from a strategy perspective and a learning perspective,
[00:17:49] it makes sense to go super broad first.
[00:17:52] - Yeah.
[00:17:52] - I mean, then there could be the super fans, like yourself,
[00:17:54] that decide to have the robot at home, even if it's a little early.
[00:17:58] - I hope it doesn't break my stuff.
[00:18:01] Yeah, I think it is interesting to see like what people's— because I assume
[00:18:04] these robots will be delivered to people and actually,
[00:18:06] I think it'll be super interesting for all of us to
[00:18:08] just see what's people's reaction.
[00:18:10] If it works 90% of the time and 10% of the time it's,
[00:18:14] you know, cracking a wine glass or something like that.
[00:18:16] Are you happy with that?
[00:18:18] If it's a $3 wine glass, maybe, I have no idea.
[00:18:21] Part of this challenge of scaling up data, I'm curious why,
[00:18:25] actually, back to this home example, and maybe there's a bunch of industrial examples,
[00:18:29] the tension and you see those-- opposite extreme of this
[00:18:32] in the context of mainline Gemini where,
[00:18:34] you know, there's billions of people using, et cetera, et cetera.
[00:18:36] We sort of have a flywheel of getting signal from the real world.
[00:18:39] Why don't we see more real live deployments of robots today in,
[00:18:47] actually, to help us scale getting a lot of this data
[00:18:50] and some of these ways, is just like it's not scalable?
[00:18:53] And I'm thinking back to, and maybe this is not right,
[00:18:55] But you see, obviously, Waymo was doing this for a long time,
[00:18:58] and had cars driving around, not being used.
[00:19:00] There's actually a ton of other self-driving car startups still doing
[00:19:03] similar things today and in operation, theoretically collecting data.
[00:19:07] I don't know what they're actually doing.
[00:19:08] And maybe I'm wrong about this, but it feels like that isn’t the case
[00:19:11] of what is happening in robotics today,
[00:19:14] at least visibly to an external observer.
[00:19:17] And I'm curious why.
[00:19:18] - Do you want to answer that?
[00:19:19] - We are going to see over the next two years if that changes a lot.
[00:19:22] But I think right now, when we talk to partners
[00:19:24] about their own experiences,
[00:19:25] we hear two things consistently.
[00:19:28] One is, while the policies are showing
[00:19:29] incredibly cool generalizing capabilities,
[00:19:32] it's actually difficult to get
[00:19:34] them to be narrowly successful,
[00:19:37] but broad enough
[00:19:37] that they can handle
[00:19:38] all the little things that vary and break
[00:19:40] over the course of an entire day. And I think you look back to autonomy.
[00:19:43] This is a really serious challenge there as well,
[00:19:45] where you can give a really impressive demo,
[00:19:47] but you're not ready to remove the safety driver for a long time.
[00:19:49] - Yeah.
[00:19:50] - And one of the distinctions between autonomy and robotics
[00:19:53] is this teleoperation option.
[00:19:55] So, you can just like, "I'll just put a safety driver in."
[00:19:57] And if the car gets stuck, they'll just take over and drive.
[00:20:00] For a lot of the robots, you know, we saw this with Aloha.
[00:20:03] We could do that.
[00:20:03] We could actually get somebody right there.
[00:20:05] And if the robot got stuck, they could take over and fix it.
[00:20:07] But as the robots get bigger, get more capable,
[00:20:10] gain more degrees of freedom, which we should actually want in a deployment,
[00:20:13] it's harder and harder for somebody to jump in and help.
[00:20:16] And so, I think we're seeing this challenge right now,
[00:20:18] where we're struggling to get that bootstrap system
[00:20:21] where it's good enough that you're ready to deploy it.
[00:20:24] And then also we're trying to figure out what is this analogy where
[00:20:27] if it does get stuck,
[00:20:28] how do I both fix it quickly and learn from that moment?
[00:20:31] And so there's little patterns forming, but right now I think everyone
[00:20:35] is really focused on how do I get this kind of baseline performance?
[00:20:38] And so I think there's a big rush in the industry
[00:20:40] and I get that baseline capability.
[00:20:42] - Yeah.
[00:20:42] - And this is part of what we're doing with our partners actually,
[00:20:45] so, as you notice, there's many different robot types here,
[00:20:47] and none of them were built by us actually.
[00:20:49] - Yeah.
[00:20:49] - So the way we work is that we have these deep partners that we work with
[00:20:52] in order to accelerate both the AI capabilities and the hardware.
[00:20:57] And so we're deeply connecting with each other
[00:20:59] to see what's missing to get to that deployment.
[00:21:02] And our goals together is to accelerate that deployment
[00:21:05] as fast as possible and to bring it to real-world applications.
[00:21:08] So that we can learn whether what we're learning is actually
[00:21:10] useful and valuable and where to spend more time next.
[00:21:14] But that's absolutely the goal that we have with our partners
[00:21:16] is how to bring this to useful applications as soon as possible
[00:21:19] and how to learn from it, how to deploy them in a safe manner
[00:21:23] so that we can get as much information as possible early on.
[00:21:27] - Yeah. Back to this two year time horizon,
[00:21:29] potentially of where we see things changing.
[00:21:31] I always make this comment to people that if you, ten years ago,
[00:21:36] were put in a very short-term time machine and landed in 2026.
[00:21:39] If you looked outside, minus anywhere where there's Waymos deployed,
[00:21:43] and you looked into a city,
[00:21:45] essentially, physically, everything looks the same.
[00:21:47] like you wouldn't be able to--
[00:21:48] maybe you'd spot a new phone that somebody had or something like that,
[00:21:51] but more or less,
[00:21:52] the physical world around us looks the same.
[00:21:55] And they'd miss the fact that we actually have these
[00:21:57] extremely intelligent, we've almost--not actually solved intelligence
[00:22:01] but made a huge amount of progress on solving intelligence.
[00:22:04] And so it's going to be very interesting to see
[00:22:06] the physical world around us start to change as like you get these
[00:22:09] new autonomous systems doing things in the real world.
[00:22:14] I'm actually curious, assuming that we get some breakthroughs
[00:22:16] the sort of dexterous manipulation problem is solved.
[00:22:19] Is it basically a manufacturing problem then,
[00:22:23] at that point, to actually just scale--
[00:22:25] or is there still fifty other things that need to land if we were to somehow,
[00:22:31] we could make dexterous manipulation work really, really well.
[00:22:34] Everything out-- navigation is solved,
[00:22:36] all the other bits of the story have been—
[00:22:39] - Yeah, I mean, I think— first of all,
[00:22:40] dexterous manipulation is the hardest task problem.
[00:22:43] - So, we would all be very happy when that is solved.
[00:22:46] But my guess is that if you want to
[00:22:48] get to the point that I think we all dream up,
[00:22:50] which is like, you walk around, and there's robots doing different things,
[00:22:53] regardless of where you are, they're helping society in a useful way.
[00:22:57] And not just in industrial settings,
[00:22:59] but I think the second problem we're going to hit
[00:23:01] is the human-centric aspect of it.
[00:23:04] It's understanding humans, being able to be useful to humans,
[00:23:07] and safe to humans in all that context.
[00:23:10] And that is something that we're also making progress towards.
[00:23:12] I think for them, for robots to be in everyday spaces,
[00:23:15] there's all kinds of safety aspects that need to also be solved,
[00:23:18] all kinds of security, privacy aspects that need to be solved
[00:23:22] that are completely parallel.
[00:23:23] And very different to dexterity.
[00:23:26] But, I certainly think if we crack the dexterity in a general way,
[00:23:31] it would definitely just blow up the opportunity
[00:23:34] of what's possible with robotics.
[00:23:35] - I think you will start seeing robots around once we have that problem.
[00:23:38] We go to robotics conferences and we get a little peek in the future.
[00:23:41] And it is crazy.
[00:23:41] You see these robots walking around giving demos.
[00:23:44] So, it feels like Star Wars, the future.
[00:23:47] So, I feel like we're a few years away from that.
[00:23:49] And this dexterous manipulation is one big chunk of that.
[00:23:52] So, maybe there's one or two of these, and then, yeah,
[00:23:55] then the tail of the things that needs to be solved, we'll get to, yeah,
[00:23:59] we'll have robots around us, and maybe the cities will start looking different.
[00:24:02] - Yeah - I think robotics is incredibly hard.
[00:24:06] - Yeah. Make a t-shirt, robotics is incredibly hard.
[00:24:09] - Yes. So, actually, I always get asked this question,
[00:24:12] when do you feel robots is going to enter our daily life?
[00:24:16] So, if you ask me like three years ago, I would say,
[00:24:19] probably beyond my lifetime.
[00:24:21] - Interesting.
[00:24:21] - If you ask me two years ago, I said maybe ten years.
[00:24:26] - Is Waymo considered a robot or no?
[00:24:28] - No. General-purpose robot.
[00:24:30] Enter our daily lives.
[00:24:32] So, if you ask me now,
[00:24:33] I think that it's between five to ten years.
[00:24:36] So, you can see the speed of evolution of this technology is amazingly fast.
[00:24:41] But there are still a lot of things that we need to solve.
[00:24:44] - I'm curious actually, though, like five to ten years away framing.
[00:24:47] Also, if you stack that up on framing,
[00:24:51] are we going to claim
[00:24:52] general purpose intelligence if you don't have this embodied characteristic?
[00:24:55] Or are these two things completely separate?
[00:24:59] - You have a biased group here.
[00:25:01] You cannot reach AGI until you solve physical AGI.
[00:25:04] So if I walked up to a robot and say, do anything that I could do,
[00:25:07] I would expect it to be able to do it.
[00:25:08] So I think that definition maybe sometimes
[00:25:11] gets lost but we all just live it every day.
[00:25:13] So I think robotics, we call this the Moravec's paradox,
[00:25:15] where things that are really easy for humans are very difficult for robots.
[00:25:19] Like, the AI is-- it's passed the bar exam,
[00:25:23] and code up all these operating systems,
[00:25:26] but they cannot cook you eggs, or flip a burger.
[00:25:29] So, there's some paradox there where physical AGI,
[00:25:32] I think is a part of AGI, at least for me,
[00:25:35] but it is in some ways more fundamentally different
[00:25:37] than the digital agents.
[00:25:39] So, it'll take, I think, a bit more work to get that.
[00:25:43] I think that will land after the digital AGI thing has happened.
[00:25:46] - Yeah. - So, I think there's,
[00:25:48] that's why you add the two plus three to get to five.
[00:25:52] - Yeah, and I think it is very possible that getting to digital AGI,
[00:25:57] and I'm sure it will, actually, dramatically accelerate
[00:26:00] the speed to our physical AGI, right?
[00:26:01] - Yeah.
[00:26:02] - Not only on the intelligent aspect, but you could also use this
[00:26:04] in order to build better robots, on the hardware side.
[00:26:08] Because we haven't talked much about sensors,
[00:26:10] but everything that we're using today
[00:26:13] is primarily ignoring all of the sensors that you have in your hand.
[00:26:17] So today, we're just using vision, and that's basically it,
[00:26:23] and the position of the hand in order to determine
[00:26:25] whether you have picked up this glass.
[00:26:27] But when I pick it up, I can feel it all over my hand.
[00:26:31] And that's something that we are not even scratching the surface on today.
[00:26:36] And we think that if you want to be able to do everything a human can,
[00:26:39] you definitely are going to need to have more sensing capabilities
[00:26:42] than what we have today on robots.
[00:26:44] So, there's an aspect of also the hardware
[00:26:45] catching up to getting to the level
[00:26:47] that is capable of achieving human-level behaviors and manipulation.
[00:26:53] - Yeah, skin is an unsolved hardware problem.
[00:26:56] - Yeah, I can imagine that being true.
[00:26:59] - You talked about these recursive loops.
[00:27:01] I think, that even in the past release,
[00:27:02] we're starting to see the very first times where
[00:27:04] the embodied reasoning model can actually watch the robot do something,
[00:27:08] and have opinions about it.
[00:27:10] And over time,
[00:27:10] that actually starts to form a real loop.
[00:27:11] You're like, I think you should go collect a little bit of different data.
[00:27:14] Or I think you should actually, and increasingly the researchers are asking,
[00:27:17] "Can you please provide an interface by which the higher level model
[00:27:20] can actually give guiding instructions to lower level models?"
[00:27:24] It's actually painful to watch sometimes because
[00:27:25] the high level model is like, "No, no, just grab it a little higher."
[00:27:28] And so we're starting to see these more and more.
[00:27:30] And so I do think, as more and more of the core capabilities
[00:27:34] of Gemini spatial reasoning, and things we do with embodied reasoning
[00:27:38] start to really get closer to AGI,
[00:27:40] you will get some of those feedback loops to start to form.
[00:27:42] - Yeah, that's super interesting.
[00:27:44] Well, let's look at a demo maybe, of the dexterous hands,
[00:27:49] because I want to see, I want to see it come to life.
[00:27:51] - Sure. Yeah.
[00:27:52] So, here we're looking at GR2, and it's controlling
[00:27:55] these very high degree of freedom hands.
[00:27:58] I think there are twenty different joints that it can control per hand.
[00:28:01] And the cool thing is that we trained GR to control
[00:28:04] the whole body and the hands with the same recipe.
[00:28:06] So, there's nothing special about the hand.
[00:28:08] It's just like we collected much more diverse,
[00:28:10] rich dexterous data, and the model is able to perform the tasks.
[00:28:14] So let's take a look at some of these tasks.
[00:28:19] - In order to be useful,
[00:28:20] a robot needs the dexterity that we take for granted.
[00:28:23] - You probably don't think about how to drive twenty-two separate joints
[00:28:26] when you operate your hand, but that's what we're asking these AI models to do.
[00:28:31] In the Gemini Robotics 2,
[00:28:32] we came up with a set of tasks in order to test and develop dexterity.
[00:28:43] So we're asking the robot to pack lunch
[00:28:46] by putting the grapes into the Ziploc bag.
[00:28:49] So this requires a lot of precision, but also a lot of coordination.
[00:28:54] Now, the really hard part is getting the Ziploc closed.
[00:28:58] Very nice job, Apollo.
[00:29:00] Hey Apollo, can you unscrew the bulb?
[00:29:03] The bulb is actually a sphere, right?
[00:29:05] So those contacts need to be very precise.
[00:29:08] For it to be engaged with the fingertips.
[00:29:10] There's actually a lot of motions
[00:29:11] and a lot of dexterity that's involved when you do that.
[00:29:14] You have to... - That was the easy Ziploc bag, too.
[00:29:16] I'm like, I can't even do the regular ones.
[00:29:18] - that's actually very complicated.
[00:29:20] Thank you, Apollo.
[00:29:22] We're advancing what we can do even with parallel grippers.
[00:29:25] Need to have dexterity, precision, and 3D space understanding.
[00:29:29] - This is the robot that you have behind you.
[00:29:31] - ...that we are trying to solve.
[00:29:34] We can move the kit around, we can move the tools around.
[00:29:37] The robot is going to be able to understand how to reorient
[00:29:41] the objects in space and then precisely put them in.
[00:29:46] The robot's task is to tie a knot, tie off the trash bag.
[00:29:51] Multifingered hands are a key ingredient
[00:29:54] for this kind of intricate knot-tying dexterity.
[00:29:58] Come on, robot, you got this.
[00:30:01] - I still have not figured out how to do it.
[00:30:03] - Yeah, what? I've never seen a tie like that before.
[00:30:07] - We are pushing our understanding of how robots may interact
[00:30:11] with complex objects in the real world, trash bags, or hazardous waste.
[00:30:16] It would be great if we could send a robot to do that,
[00:30:19] rather than have humans put themselves at risk.
[00:30:29] - Very cool.
[00:30:30] And so in this example, the— this is like a partner hardware
[00:30:37] that we've generalized the ER model to be able to
[00:30:41] work on that specific set of hands in that context?
[00:30:45] - So, this is the Gemini, the VLA, the action model.
[00:30:48] - The action model. Okay. - Yeah.
[00:30:49] So, that one is trained to then use these high dexterity hands.
[00:30:54] So, we did collect teleoperation data to see how the task can be done.
[00:30:58] And then that data helps the model understand how to control these robots.
[00:31:01] - And does the dexterous hand use case generalize? Or is that also something
[00:31:07] that as you see across all the different hardware robotic partners,
[00:31:10] the hands are all different or the degrees of freedom
[00:31:13] are different and that's why it makes it complicated?
[00:31:15] - So, I think that hands are a good
[00:31:16] place to just push the limits of dexterity,
[00:31:18] but we are seeing some really cool signs of cross-embodiment transfer.
[00:31:21] In our GR 1.5 release, we talked about this more explicitly where, yeah,
[00:31:25] we are seeing transfer between the gripper task and the hands task.
[00:31:28] So, these models, when we train it with all the data,
[00:31:31] we don't train per-embodiment models.
[00:31:32] GR 2 is trained on many robots.
[00:31:35] And we do see these signs of life, like it understands basic concepts,
[00:31:38] and it can transfer that action from one robot to the other.
[00:31:42] - And this is actually really important because I think
[00:31:44] robots will continue to evolve all the time.
[00:31:46] And we see it even in all the robots that we have every year,
[00:31:50] like they evolve in some interesting way, right?
[00:31:53] And the hands is one of those areas that is
[00:31:55] very ripe for a lot of acceleration over the next year.
[00:31:59] So, we fully expect the hands to be changing constantly.
[00:32:02] So, I think it is really important to enable models
[00:32:05] that can work across all these different embodiments.
[00:32:07] And fundamentally, if you're actually doing a task
[00:32:11] where you're organizing things,
[00:32:13] I mean, 90% of that task is not about exactly how you move your hands.
[00:32:16] It's about understanding where you're putting things.
[00:32:19] And then the last 10% is about exactly how you move your hand to achieve it.
[00:32:23] And so a lot of that transfers between robots.
[00:32:25] Of course, there is some limitations,
[00:32:26] like a gripper can only grasp things this way,
[00:32:29] and a hand could actually do something more complex.
[00:32:33] But there's a lot of semantics that are shared between them.
[00:32:37] - I'm curious actually if models having code quality
[00:32:42] is at all correlated with some of these use cases.
[00:32:45] And maybe my mental model is off on this, but you imagine you can
[00:32:51] deterministically program robots in certain cases.
[00:32:53] And so could you, I'm curious if we do anything around that,
[00:32:57] or if that's actually a use case that's helped, assuming we get
[00:33:01] super intelligence at code, whatever, in the next couple of years
[00:33:03] because we're hill climbing it, does that somehow help?
[00:33:07] You could almost deterministically program
[00:33:09] sequences of things that the robots are doing, or is that not?
[00:33:14] - I can give you one example.
[00:33:15] - So, I think one place that can really come into play is in simulation.
[00:33:19] So on the real robot, it's very difficult to write deterministic code
[00:33:22] that can actually take in just a raw set of pixels
[00:33:24] from a bunch of different cameras,
[00:33:25] and actually give you thoughtful, correct joint angles.
[00:33:27] So, you can play some games with inverse kinematics,
[00:33:29] but it's really hard.
[00:33:30] In the simulator,
[00:33:31] you often have access to privileged information.
[00:33:33] So, you actually secretly know exactly how far away
[00:33:35] this lid is from my fingers.
[00:33:37] And so if you can get to a point where you're really starting to
[00:33:39] build confidence, where the simulator is actually either a source of data,
[00:33:43] or a place you want to evaluate a policy,
[00:33:45] now, you can basically use that code to guide
[00:33:47] yourself in much more precisely, because you actually have access to
[00:33:51] really correct resolution, really precise information, rather than forcing
[00:33:56] that code to kind of interpret sort of the messiness of the real world.
[00:33:59] - Yeah, yeah, yeah. No, that makes sense.
[00:34:00] - Interesting.
[00:34:01] - Even for accelerating the research loop, right?
[00:34:04] We're using agents today, right?
[00:34:05] To be able to run experiments, see what works, see what did not work,
[00:34:09] plot the differences,
[00:34:10] detect that something is going the wrong direction early,
[00:34:12] and then change parameters. All of that is already happening.
[00:34:14] Right. So, in that sense, yeah.
[00:34:16] - It's exciting. - So those will not be simple code.
[00:34:19] So I think that we have tried to write code to control robots for decades.
[00:34:24] - Right.
[00:34:25] - So, because those code, if it's rule-based,
[00:34:26] it's very hard to generalize to all kinds of environments.
[00:34:30] This is why we are switching to this very data-driven paradigm.
[00:34:33] But in theory, all the neural networks, training,
[00:34:36] data-driven, optimization, they're still within the code space.
[00:34:39] We still write code to generate all these things.
[00:34:42] So, I think eventually it's possible,
[00:34:44] but it requires a lot of auto research to make that happen.
[00:34:48] - Yeah.
[00:34:48] - I was thinking about routines almost very explicit,
[00:34:53] I guess, maybe the action space is too unconstrained to make that happen,
[00:34:58] but could I, I don't know.
[00:35:00] I was thinking of examples where like it might, you could do something useful,
[00:35:04] if you could write code to do some of these use cases deterministically.
[00:35:08] But no, I hear what you're saying that it doesn't generalize well.
[00:35:12] Well, so how can people actually start getting access to the model?
[00:35:14] I feel like it's, we've made a bunch of progress.
[00:35:16] What's the availability story?
[00:35:17] Where can people actually start using it?
[00:35:19] - Yeah, we're really excited.
[00:35:20] So, Embodied Reasoning 2.0 or 2 is going to come out,
[00:35:24] that'll be directly available via AI Studio.
[00:35:26] And I think I can say this but soon it'll be available
[00:35:28] via the Gemini Enterprise
[00:35:31] - Agents Platform. - Agents Platform.
[00:35:34] - But Gemini Robotics 2, we'll have the embodied reasoning model
[00:35:39] available directly via an API, and that will be generally accessible,
[00:35:42] and we really encourage people to use that.
[00:35:44] And then the action models themselves are also going to be available.
[00:35:47] We work directly with our deep partners,
[00:35:49] so they'll be the ones who use the biggest strongest versions.
[00:35:52] We also have an on-device version of that, that our trusted testers can use.
[00:35:56] And so people are welcome to join.
[00:35:58] We currently have a waitlist-- but we're trying to do more about it--
[00:36:00] our trusted tester program.
[00:36:02] And then, they can actually get access to an on-device deployable version
[00:36:05] of the action model, where they can
[00:36:06] actually fine-tune that model directly on either
[00:36:09] their tasks or their robots and actually try it out in practice.
[00:36:12] - Yeah, that's awesome. I'm excited.
[00:36:13] What--
[00:36:14] any advice? And maybe maybe I'm misremembering this, but I feel like we
[00:36:18] do have a bunch of customers who use the ER models who actually aren’t
[00:36:22] robotics companies, and they just
[00:36:23] happen to be in one of these domains for video,
[00:36:26] audio, spatial understanding, or something like that.
[00:36:28] I don't know if that's a suggested path for folks,
[00:36:32] but I assume it's those domains of video, spatial understanding,
[00:36:36] where the ER model is better on a bunch of these core benchmarks.
[00:36:40] - Yeah, I mean, these models are better in a few ways.
[00:36:42] The ER model in particular.
[00:36:44] This release is a lot better at video understanding.
[00:36:46] So before, it's always been very good,
[00:36:49] and state-of-the-art at spatial understanding.
[00:36:51] So 2D and 3D bounding box,
[00:36:54] understanding where objects are in 3D space.
[00:36:56] Now, it can understand videos.
[00:36:57] It understands also the semantics of a task.
[00:37:00] So if you ask it,
[00:37:01] at what point should I stop pouring my coffee?
[00:37:03] Or am I done closing this Ziploc bag?
[00:37:06] It actually understands how far along you are in that progress.
[00:37:09] And so that's extremely useful whether you're doing
[00:37:11] any kind of like video understanding capability, or for robotics, exactly.
[00:37:15] If you use it as your agent, then now, it can be the agent
[00:37:18] that understands how far along you are, and decides to
[00:37:21] switch to a different task or decide that you're done.
[00:37:24] And then these models are also significantly safer.
[00:37:27] This is our safest model yet, and it's safer not only in the regular way
[00:37:33] in which all of our Gemini models are safe, in terms of content safety,
[00:37:37] but it's also safer because it understands
[00:37:41] the likelihood that a model is going to be completing a task.
[00:37:46] So, it also helps you understand the— if you give
[00:37:49] an instruction that is very ambiguous, for example, then,
[00:37:52] it will ask proactively the human, "Oh, that instruction is very ambiguous.
[00:37:56] What do you mean?"
[00:37:57] And so it helps with proactive clarification.
[00:37:59] And then the last one is that we're also
[00:38:01] making it really strong at detecting humans,
[00:38:03] and humans' proximity to robots, which is very important when
[00:38:06] you're talking about collaborative robots that are in human-centric spaces.
[00:38:10] So those are just a few areas.
[00:38:11] We're also introducing a new safety benchmark that we have open source.
[00:38:15] It's called Asimov Agentic.
[00:38:18] Asimov is our benchmark and it essentially has a large set of examples,
[00:38:24] real-world examples, where you have to make a decision about what the robot
[00:38:29] would do next or what you should do next based on this situation.
[00:38:33] So it's a lot about semantic physical understanding.
[00:38:36] It's a lot about common sense that robots would need to have,
[00:38:39] if they're going to be operating and doing lots of tasks around us.
[00:38:42] - Very cool. This was an awesome conversation.
[00:38:45] It was super interesting to hear about the launches.
[00:38:46] I'm very excited for folks to get their hands on the models.
[00:38:49] It's cool to also come to y'all's space.
[00:38:51] I feel like there's, it's very-- much more interesting
[00:38:54] than the normal Google offices.
[00:38:56] So, I'm glad to be a guest and see
[00:38:59] all the cool hard work that you all are doing.
[00:39:00] So congrats on the launch.
[00:39:02] Very excited. Thanks everyone for watching this episode of Release Notes.
[00:39:05] We'll see you in the next one.
```
