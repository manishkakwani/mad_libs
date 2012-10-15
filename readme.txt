This is the first Ruby Quiz from the Best of Ruby Quiz book: 

-----------------------------------
This Ruby Quiz is to write a program that presents the user with that
favorite childhood game, Mad Libs. Don’t worry if you have never
played; it’s an easy game to learn. A Mad Libs is a story with several
placeholders. For example:

I had a ((an adjective)) sandwich for lunch today.
It dripped all over my ((a body part)) and ((a noun)).

The reader, the only person who sees the story, will ask another person
for each placeholder in turn and record the answers. In this example,
they would ask for an adjective, a body part, and a noun. The reader
then reads the story, with the answers in place. It might come out
something like this:

I had a smelly sandwich for lunch today. It dripped all over my big toe and bathtub.
Laughter ensues.

The script should play the role of reader, asking the user for a series of
words, then replacing placeholders in the story with the user’s answers.
We’ll keep our story format very simple, using a ((...)) notation for place-
holders. Here’s an example:

Our favorite language is ((a gemstone)).

If your program is fed that template, it should ask you to enter “a gem-
stone” and then display your version of the story:

Our favorite language is Ruby.


-----------------------------------

I focused on this problem in stages, starting with procedural code and moving to object oriented code. 

On my first attempt I wanted to ensure that I didn't use any regexes.  The challenge there was using both '((' and '))' as separate delimiters, and extracting what was in between.  Ruby 1.9 has a new partition method, which helped extract the important sub-strings as I continued through the string.  Using multiple assignment avoided the need for temporary variables. 

Substituting the user's values into the string required a lot more work without regexes because after partitioning, the words in between the '((' and '))' had to be removed using string indexing on the substrings.  

v2: switch to regex; switch to hash instead of array; remove some temp variables

v3: refactor to object-orientation, initialized to empty structures so I didn't have to pass parameters, created one public play method, and every other implementation method is private

Note: Ruby Quiz treats this as a templating problem, but I didn't go this route; I just focused on running from the command line. 
