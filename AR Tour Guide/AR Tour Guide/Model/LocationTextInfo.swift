//
//  LocationInfo.swift
//  AR Tour Guide
//
//  Created by Adithya Nair on 2/16/20.
//  Copyright © 2020 Creative Labs. All rights reserved.
//

import UIKit

class LocationTextInfo {
    
    var textInfoDictionary = [
        
        "Covel Commons": """
                        __________________
                        Living on the Hill
                        ￣￣￣￣￣￣￣￣

                        Welcome to the Hill, the home for many Bruins. To experience university life fully, nothing equals living on campus where students can enjoy convenience and a sense of community. Each community, whether it is a high-rise hall, a plaza building, residential suite, or apartment, has a variety of resources and amenities for residents to enjoy. UCLA’s on-campus housing is just a short walk away from classrooms, libraries, and sports facilities. With housing and dining needs met, students can concentrate on their academic success and personal growth.

                        __________________
                        Dining on the Hill
                        ￣￣￣￣￣￣￣￣
                        UCLA Dining Services is an award-winning program that is nationally recognized for its high quality cuisine and innovative services. In fact, it was ranked as the best college dining in the nation by Niche. UCLA dining services are only a quick couple steps away from residential buildings on the Hill. There are 8 dining halls which caters to the needs of students and guests with convenience and a wide variety of menu choices. Vegetarian and vegan meals are available everyday at each residential restaurant on top of a variety of cuisines such as Asian, Mediterrian, and much more!

                        """,
        
        "Bruin Plaza": """
                        ____________________
                         The Bruin Bear Statue
                        ￣￣￣￣￣￣￣￣￣￣￣￣

                        The Bruin Bear, a large bronze sculptural representation of the mascot, Joe Bruin, is the regal landmark statue of UCLA. In 1984, to mark its 50th Anniversary, the UCLA Alumni Association commissioned "Mighty Bruins" and presented the Bruin Bear Statue to the university. Every year during the UCLA-USC rivalry game, the bruin goes into a hibernating state and is protected from USC’s vandalization.


                        ____________
                         Ashe Center
                        ￣￣￣￣￣￣￣

                        The Arthur Ashe Student Health and Wellness Center is devoted to providing quality, accessible, healthcare and education to support the unique development of UCLA students. It is committed to helping students “shine, inside and out.” From eating well and staying active to managing stress, The Ashe Center focuses on student wellbeing by providing ongoing wellness workshops, participating in health-related outreach events on campus.

                        ______________
                         Wooden Center
                        ￣￣￣￣￣￣￣￣￣

                        The John Wooden Center is a 95,000 square foot recreation center named after legendary basketball coach John Wooden. It is the main building for intramural athletics at UCLA. In addition, it serves as one of the home venues for the UCLA women's volleyball team and also houses the training gym for the UCLA gymnastics team.

                        ___________
                         UCLA Store
                        ￣￣￣￣￣￣￣

                        The UCLA store is located just right opposite to the UCLA Athletics Hall of Fame. Visitors can buy anything UCLA and more in the store. It is just like a super store with books, food, computers, electronic supplies, supermarket, cosmetic, and gifts!

                        """,
        
        "Court of Sciences": """
                            ________________
                             Inverted Fountain
                            ￣￣￣￣￣￣￣￣￣￣
                            Since its unveiling, the Inverted Fountain has become steeped in student tradition and lore. During orientation, freshmen are commonly “initiated” by touching the water, and are then forewarned that doing so again before graduation will tack on an extra quarter to their academic career. That’s why one just might see graduating seniors wading into the fountain to celebrate their last final exam, water guns in tow to blast nearby underclassmen. At least, that’s how the story goes...

                            ___________
                             Boelter Hall
                            ￣￣￣￣￣￣￣
                            Boelter Hall, part of the Samueli School of Engineering & Applied Science, was named in honor of UCLA's first dean of Engineering, and international authority in the field of heat and mass transfer. It is also known for being the birthplace of the Internet, as the first Internet message was sent from Boelter Hall 3420 and delivered to Stanford Research Institute on Oct. 29, 1969.

                            _____________________________
                              Mathematical Sciences Building
                            ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
                            The Mathematical Sciences Building is home to the Atmospheric Sciences, Statistics, and Mathematics departments. This building also contains the UCLA planetarium.

                            ________
                             Geology
                            ￣￣￣￣￣
                            The Geology Building is the UCLA home of Earth & Space Sciences and the Institute of Geophysics and Planetary Physics.

                            """,
        
        "Dickson Court": """
                        ___________
                          Royce Hall
                        ￣￣￣￣￣￣￣

                        Royce Hall is one of UCLA’s most culturally rich buildings and a symbol of both intellectual and artistic excellence. Like Carnegie Hall and Lincoln Center, Royce Hall is one of America’s great concert halls, distinguished, not only for its impeccable beauty and refined acoustics, but also for the ghosts of performances that haunt it. Royce Hall has hosted many prominent artists such as Frank Sinatra, Ella Fitzgerald, Leonard Bernstein and the New York Philharmonic, Twyla Tharp, Frank Zappa, Mikhail Baryshnikov, The Philip Glass Ensemble and Meredith Monk to name a few.

                        _____________
                         Powell Library
                        ￣￣￣￣￣￣￣￣

                        Powell Library offers students opportunities to discover their intellectual passions, explore their creative talents, and engage in community with others. Our services, spaces, collections, and programs promote student learning and success at UCLA and beyond. Services include research and instructional consultations and workshops in the Inquiry Labs, learning and instructional technology support in the CLICC Labs, and writing consultations offered in partnership with the Undergraduate Writing Center.

                        """,
        
        "Wilson Plaza": """
                        _______________________
                         Student Activities Center
                        ￣￣￣￣￣￣￣￣￣￣￣￣￣￣

                        The student activities center is a big umbrella that hosts various departments within. Community Programs Office is UCLA’s cross-cultural center that aims to nurture an inclusive and diverse community by engaging and empowering students to develop and execute student-initiated, student-run outreach, service and retention programs. Student activities center also offers an 8 lane, outdoor swimming pool located at the heart of the campus that allows students to take a break from studying, and relax like no other.

                        _______________
                         Intramural Field
                        ￣￣￣￣￣￣￣￣￣

                        The intramural field is one of the many UCLA Recreation facilities. The intramural field is a 10 acres field that accommodates Intramural Sports, Club Sports, Open Recreation, Summer Camps, and various special event activities.

                        _______________
                         Fowler Museum
                        ￣￣￣￣￣￣￣￣￣

                        The Fowler Museum at UCLA explores global arts and cultures with an emphasis on works from Africa, Asia, the Pacific, and the Americas—past and present. It is named in honor of Francis E. Fowler Jr., inventor and lifelong art collector. "Reflecting Culture," an exhibit of Fowler's silver collection, is on permanent display. The Fowler offers free admission and easy parking to all its visitors.

                        """,
        
        "Sproul Hall": "I don't like classic triples.",
        
        "De Neve": "Adithya lives here!"
        
    ]
    
    func getInfo(for key: String) -> String { return textInfoDictionary[key]! }
    
}
