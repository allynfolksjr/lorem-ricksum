# Lorem Ricksum

Generate some swell Lorem Ipsum through the eyes of Rick Steves.

# Origin of Words

## TV Scripts

Most of the words are automatically generated from a rough 'n dirty load of the most commonly-used words from Rick's tv shows. `rake rick:load_scripts` will crawl the Rick Steves website and update the list as required. By default, the application contains a list at `lib/rick_steves_words.yml`, which contains a serialized-array of the words sorted by frequency. This list is lightly curated to mostly remove common words such as "the," "an," and other things that aren't distinctly Rick-ish.

### NOTE

Running `rake rick:load_scripts` will create a NEW file called `lib/raw_tv_show_ewords.yml` You will need to overwrite `lib/rick_steves_words.yml` with this new file if you want the Word Combination Process (described below) to include these words.

## Manually-curated list

In addition to the TV scripts, a list of manually-curated phrases are included in `custom_phrases.` For customization, add a phrase, one per line, and then run the task `rake rick:regenerate` This will combine the list of words.

## Word Combination Process

To generate the list of phrases the site uses, the task `rake rick:generate` will combine the manually-curated list with the automatic TV phrases using logic somewhat like this:

1. Add every word from the TV series that has been said more than 100 times.
2. Use some YOLO-style weighting and add the custom_phrases twice. This is so they appear more often without doing a more advanced weighting method.

You can always see the latest logic by viewing the method `generate_ipsum_file` in the `lib/rick_utils.rb` file. It may be desirable to tweak the YOLO-style weighting and the logic to include words from the TV series.
