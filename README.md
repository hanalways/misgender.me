# misgender.me
TechTogether - Boston Hackathon 2019

Even when websites don't explicitly ask users for their gender, they often use predictive models to gender users based on data the sites collect. Twitter, for example,doesn't ask for gender upon registration, but assigns users a binary gender, which users can access by going to their settings and clicking on 'My Twitter Data'. While it is unclear what kinds of models or features Twitter uses to determine a users' gender, it is apparent that Twitter's gendering algorithm is biased. 

Our project aims to call out the implicit bias in gendering algorithms by creating a WebApp that genders users based on information collected from their twitter accounts, informs users about how to access their "Twitter-Assigned Gender", and collects information about how often users are misgendered in correlation with race and gender identity.

# Background

Twitter skews towards gendering users as male, as seen [here](https://readwrite.com/2014/09/03/twitter-analytics-demographics-gender-algorithm-male-female-followers/), and often misgenders trans and gender diverse users, as seen [here](https://mashable.com/2017/05/20/transgender-twitter-gender-guessing-ad/#DPZOSLT4hmqH)

After researching gendering algorithms in other APIs to attempt to understand Twitter's gender black box, we deduced that it possibly relies on the following features.

* **First name**
Twitter possibly uses the user's first name to assign them a gender, using a model trained on names corresponding to gender. This model may be problematic if the corpus is mainly based on names common in the US, and disregards names originating from other cultures. Ambiguously gendered names are often skewed towards being gendered as male.

* **Facial recognition**
Facial recognition algorithms often misgender transgender and gender non-conforming people. There have also been studies that observe a pattern of misgendering women of color, especially black women. The video below, from MIT's Gender Shades project, discusses why these biased algorithms are problematic in a society that increasingly integrates them into everyday life.
[![MIT Gender Shades project](http://img.youtube.com/vi/TWWsW1w-BVo/0.jpg)](http://www.youtube.com/watch?v=TWWsW1w-BVo)

* **Content of posts**
Twitter possibly uses the text of users' posts as a factor to determine gender. While this may lead to accurate results when users use gendered language in reference to themselves ("woman", "girl", "mom"), but it may also gender people based on topics they commonly post about or words they use. We noticed that the use of the word "sorry" when testing text gender analysis APIs resulted in text being identified as female with high confidence. In our research, we also saw that in one model, "software" was an "anti-selector" for identifying females. [We're not kidding](https://www.figure-eight.com/using-machine-learning-to-predict-gender/) ¯\_(ツ)_/¯

