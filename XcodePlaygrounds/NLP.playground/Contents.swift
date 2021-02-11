/*: ## A Natural Language Playground
 This playground show you a couple easy-to-use tools from the `NaturalLanguage` framework.
 
*/

import NaturalLanguage

let text = """
All human beings are born free and equal in dignity and rights.
They are endowed with reason and conscience and should act towards one another in a spirit of brotherhood.
"""
let italianText = "Noi leggiamo il libro \"Develop in Swift Fundamentals\""
let flannText = """
Dalkey is a little town maybe twelve miles south of Dublin, on the shore. It is an unlikely town, huddled, quiet, pretending to be asleep. Its streets are narrow, not quite self-evident as streets and with meetings which seem accidental. Small shops look closed but are open. Dalkey looks like an humble settlement which must, a traveller feels, be next door to some place of the first importance and distinction. And it is -- vestibule of a heavenly conspection.
""" // From Flann O'Brien's _The Dalkey Archive_

/*: ### Breaking a string into words
 An example of tokenizing a string by word... or some other unit, like a paragraph
 */
func tokenize(text: String) {
    let tokenizer = NLTokenizer(unit: .word)
    tokenizer.string = text

    var totalWordsCount = 0
    tokenizer.enumerateTokens(in: text.startIndex..<text.endIndex) { tokenRange, _ in
        print(text[tokenRange])
        totalWordsCount += 1
        return true
    }

    print("\(totalWordsCount) total words in the text")
}

tokenize(text: text)

/*: ### Analyze parts of speech

 With this function we analyse the text for parts of speech
We can see which words are adjectives, verbs, nouns...
*/
func identifyPartsOfSpeechFor(text: String) {
    let tagger = NLTagger(tagSchemes: [.nameTypeOrLexicalClass])
    tagger.string = text
    let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace]
    tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .nameTypeOrLexicalClass, options: options) { tag, tokenRange in
        if let tag = tag {
            print("\(text[tokenRange]): \(tag.rawValue)")
        }
        return true
    }
}

identifyPartsOfSpeechFor(text: text)


/*: ### Identify the language of some text
And here we use `NLLanguageRecognizer` to guess the dominant language of a block of text
*/
func identifyLanguageOf(text: String) {
    let recognizer = NLLanguageRecognizer()
    recognizer.processString(text)

    if let dominantLanguage = recognizer.dominantLanguage {
        let locale = NSLocale(localeIdentifier: dominantLanguage.rawValue) // Let's display the language in the language, itself
        if let language = locale.localizedString(forLanguageCode: dominantLanguage.rawValue) {
            print("This text is in \(language)")
        }
    } else {
        print("We could not detect a dominant language.")
    }

}

identifyLanguageOf(text: italianText)
identifyLanguageOf(text: flannText)
