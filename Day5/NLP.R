install.packages("algorithmia")
library(algorithmia)

#summarize
input <- "The shifting of Indian Premier League cricket matches out of Chennai reflects poorly on the Tamil Nadu administration. It is misleading to see the development as a victory for protesters espousing the Cauvery cause or as the inevitable result of the current political mood in Tamil Nadu. By conveying its inability to give adequate police security to the remaining matches to be held in the city, the State government, which had adopted a wishy washy attitude towards holding the IPL in Chennai, simply capitulated. It is undeniable that there were aggressive protests around the Chepauk stadium just before the seasons first match in the city. Road blockades, frayed tempers and scuffles between the police and protesters suggested it would be a challenge to hold more matches. But governments exist to maintain public order and are expected to stand up to threats made by a fringe, whether it is calling for the ban of a book, a film or a cricket match. If cricket is a victim of such protests, it is because of its very success. It is a soft high-profile target for those who want to raise their visibility and profile. This is why the sheer irrationality of singling out one tournament which has no connection whatsoever to the Centre or the State government or the Cauvery crisis for that matter was lost on those leading the call for a ban."
client <- getAlgorithmiaClient("simM5HQjwDaIFIgZdRWrhcP9kJ51")
algo <- client$algo("nlp/Summarizer/0.1.7")
result <- algo$pipe(input)$result
result

#auto text extraction
input <- "The shifting of Indian Premier League cricket matches out of Chennai reflects poorly on the Tamil Nadu administration. It is misleading to see the development as a victory for protesters espousing the Cauvery cause or as the inevitable result of the current political mood in Tamil Nadu. By conveying its inability to give adequate police security to the remaining matches to be held in the city, the State government, which had adopted a wishy washy attitude towards holding the IPL in Chennai, simply capitulated. It is undeniable that there were aggressive protests around the Chepauk stadium just before the seasons first match in the city. Road blockades, frayed tempers and scuffles between the police and protesters suggested it would be a challenge to hold more matches. But governments exist to maintain public order and are expected to stand up to threats made by a fringe, whether it is calling for the ban of a book, a film or a cricket match. If cricket is a victim of such protests, it is because of its very success. It is a soft high-profile target for those who want to raise their visibility and profile. This is why the sheer irrationality of singling out one tournament which has no connection whatsoever to the Centre or the State government or the Cauvery crisis for that matter was lost on those leading the call for a ban."
client <- getAlgorithmiaClient("simM5HQjwDaIFIgZdRWrhcP9kJ51")
algo <- client$algo("nlp/Autotag/1.0.1")
result <- algo$pipe(input)$result
result

#sentiment analysis
input <- list("document"="I am happy!")
client <- getAlgorithmiaClient("simM5HQjwDaIFIgZdRWrhcP9kJ51")
algo <- client$algo("nlp/SentimentAnalysis/1.0.4")
result<-algo$pipe(input)$result
result

#named entity recognition
input <- list("document"="I went to Stanford University")
client <- getAlgorithmiaClient("simM5HQjwDaIFIgZdRWrhcP9kJ51")
algo <- client$algo("StanfordNLP/NamedEntityRecognition/0.2.0")
result<-algo$pipe(input)$result
result         

#Chatbot Parser
input <- list("src"="The shifting of Indian Premier League cricket matches out of Chennai reflects poorly on the Tamil Nadu administration. It is misleading to see the development as a victory for protesters espousing the Cauvery cause or as the inevitable result of the current political mood in Tamil Nadu. By conveying its inability to give adequate police security to the remaining matches to be held in the city, the State government, which had adopted a wishy washy attitude towards holding the IPL in Chennai, simply capitulated. It is undeniable that there were aggressive protests around the Chepauk stadium just before the seasons first match in the city. Road blockades, frayed tempers and scuffles between the police and protesters suggested it would be a challenge to hold more matches. But governments exist to maintain public order and are expected to stand up to threats made by a fringe, whether it is calling for the ban of a book, a film or a cricket match. If cricket is a victim of such protests, it is because of its very success. It is a soft high-profile target for those who want to raise their visibility and profile. This is why the sheer irrationality of singling out one tournament which has no connection whatsoever to the Centre or the State government or the Cauvery crisis for that matter was lost on those leading the call for a ban.","format"="tree","language"="german")
client <- getAlgorithmiaClient("simM5HQjwDaIFIgZdRWrhcP9kJ51")
algo <- client$algo("deeplearning/Parsey/1.1.0")
result<-algo$pipe(input)$result
result 
