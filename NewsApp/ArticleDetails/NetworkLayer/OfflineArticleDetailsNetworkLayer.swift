//
//  OfflineArticleDetailsNetworkLayer.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-27.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import Foundation

class OfflineArticleDetailsNetworkLayer : ArticleDetailsNetworkLayerProtocol {
    
    
    func fetchDetailsFromArticle(_ article: Article, completion: @escaping (Article) -> Void) {
        let newArticle = article
        newArticle.content = "<p>So much of growing up is about learning the rules of the game. For a child, making sense of what is and isn’t permitted is endlessly perplexing. No surprise then that in at least two of the shows in the Edinburgh international children’s festival, the theme of rules and rule-breaking looms large.</p> <p>“If you follow all the rules, you miss out on all the fun,” says Christine Johnston in the title role of <a href=\"https://www.theguardian.com/stage/2018/may/27/baba-yaga-paisley-arts-centre-review-spooky-remix\">Baba Yaga</a>, a co-production between Scotland’s Imaginate and Australia’s <a href=\"https://windmill.org.au/\">Windmill</a>. With her handbag hat and pompom necklace, she looks like a woman who knows a thing or two about transgression. A kind of Technicolor Cruella de Vil with the added swagger of a drag queen, she has taken residence in an upper storey of Poultry Park apartments and annoyed the neighbours by keeping pets, sticking drawing pins in the walls and playing loud music.</p> <p>To be fair, the neighbours are a nimbyish lot, as poor receptionist Vaselina knows only too well. Played by Shona Reppe in a chrysalis-like silver-grey Parka, she can’t polish her set of Russian dolls, fill in a form or peel a banana without someone complaining about the noise. She’s actually quite the mousy sort, shy and obedient with an ever-tidy desk – which only makes Baba Yaga, who communicates primarily in raucous song, seem all the more extraordinary.</p> <p>The play is an unconventional take on <a href=\"https://en.wikipedia.org/wiki/Baba_Yaga\">a piece of Slavic folklore</a>, although Baba Yaga’s affinity with nature remains. When the conversation flags, she tends to turn into a bee (splendidly realised in Chris Edser’s animations) and when she nurtures her plants, she whips out two recorders and plays them at once – through her nose. </p> <p>Directed by Rosemary Myers, it is a funny and eccentric barrage of invention, even if the delirious thrill of watching Vaselina on an animated ski slope or the two of them on a trip into space are distractions from uncertainties in the story. We know why Vaselina is fascinated by Baba Yaga, but what are this mysterious creature’s intentions towards the receptionist?</p>  <figure class=\"element element-image\" data-media-id=\"c0dfe3e4cb0cad6dcbf4e620dc78c80c4b9c8adf\"> <img src=\"https://media.guim.co.uk/c0dfe3e4cb0cad6dcbf4e620dc78c80c4b9c8adf/310_39_3380_2028/1000.jpg\" alt=\"A modern-day Buster Keaton … Andy Manley.\" width=\"1000\" height=\"600\" class=\"gu-image\" /> <figcaption> <span class=\"element-image__caption\">A modern-day Buster Keaton … Andy Manley.</span> <span class=\"element-image__credit\">Photograph: Mihaela Bodlovic</span> </figcaption> </figure>  <p>Playing to a slightly younger audience, Andy Manley’s Stick By Me is also focused on boundaries, rules and limits. In this wordless one-man show, a masterclass in comic choreography, the rules he establishes in his theatrical game are a metaphor for the rules every four-year-old has to navigate in life. </p> <p>He discovers it is forbidden to step beyond the playing space, yet it seems looking inside the sealed cardboard box is allowed. When he invents his own rules by outlining the shape of a room with masking tape, does he have the right to pass through the invisible walls?</p> <p>Like a modern-day Buster Keaton, almost but not quite in control of his environment, Manley plays with the idea of sticks and stickiness. A routine in which he must maintain contact with his desk (while his chair is surreally sticking to him) morphs into the discovery of new friends in the form of ice-lolly sticks. Just like real friends, they need care and attention and, just like in real life, accidents will happen. </p> <p>Co-created with director Ian Cameron and exquisitely timed to the music of Will Calderbank, this is a joyful and funny show that is also about injury, disability, loss, death, love and friendship.</p> <ul> <li>Edinburgh international children’s festival is at various venues until 3 June. <a href=\"http://www.imaginate.org.uk/\">Box office</a>: 0131-228 1404.</li> </ul>"
        newArticle.title = newArticle.content ?? ""
        DispatchQueue.main.asyncAfter(deadline: .now()){
            completion(newArticle)
        }
    }
}
