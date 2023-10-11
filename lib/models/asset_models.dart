import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mechar/models/cart_models.dart';
import 'package:mechar/models/category_contructor.dart';
import 'package:mechar/models/furniture_assets.dart';

List<Furniture> furnitureAssets = [
  Furniture(
      title: 'Ebony Elegance Sofa',
      description:
          'Introducing the Ebony Elegance Sofa, a sleek and sophisticated addition to any living space. Crafted in timeless black, this sofa effortlessly blends modern design with classic comfort, creating a statement piece that complements various interior styles.\n\nThe Ebony Elegance Sofa features a plush, velvet upholstery that not only adds a touch of luxury but also ensures a soft and inviting feel. The deep ebony hue exudes a sense of refined opulence, making it a focal point in your room. The clean lines and minimalist silhouette contribute to its contemporary charm, while the carefully tailored details showcase a commitment to both style and functionality.\n\nSink into the generously padded cushions that provide unparalleled comfort, whether you\'re lounging for a movie night or entertaining guests. The black hue serves as a versatile canvas, allowing you to experiment with vibrant throw pillows or contrasting decor elements to personalize your space.\n\nBuilt on a sturdy frame, the Ebony Elegance Sofa is not just a visual delight but a durable investment. The rich black color adds a touch of drama and sophistication, making it a versatile choice for both modern and traditional interiors. Elevate your living room with the timelessly chic Ebony Elegance Sofa, where comfort meets style in perfect harmony.\n',
      price: 4999000,
      location: 'Jakarta Barat',
      arUrl: 'Furniture Assets/Sofa/Sofa 1/sofa (2).glb',
      imgUrl: 'Furniture Assets/Sofa/Sofa 1/Sofa_1.jpg',
      category: Category.sofa,
      id: '1'),
  Furniture(
      title: 'Royal Majesty Sofa—a',
      description:
          'Introducing the epitome of opulence, the Royal Majesty Sofa—a masterful blend of sophistication, comfort, and timeless design. Crafted for those who demand nothing but the finest, this luxury sofa redefines elegance in the realm of home furnishings.\n\nAdorned in sumptuous, hand-selected materials, the Royal Majesty Sofa features a regal upholstery that exudes a rich texture and an air of exclusivity. Every inch of this masterpiece is meticulously detailed, showcasing exquisite craftsmanship that speaks to a legacy of fine furniture creation.\n\nThe design of the Royal Majesty Sofa transcends trends, with its classic silhouette and refined lines. The harmonious marriage of form and function is evident in every curve and contour, creating a sense of balance and grace that captures the essence of true luxury.\n\nIndulge in unparalleled comfort with plush, down-filled cushions that cradle you in a cloud of softness. The upholstery, selected for both its tactile pleasure and enduring quality, invites you to experience a level of relaxation reserved for the connoisseur of fine living.\n\nAs a symbol of enduring style, the Royal Majesty Sofa stands proudly on a meticulously crafted frame, ensuring longevity and stability. Each detail, from the intricately carved legs to the hand-finished upholstery, reflects a commitment to excellence that defines luxury at its highest standard.\n\nImmerse yourself in the unparalleled sophistication of the Royal Majesty Sofa—a testament to the artistry of fine living and a statement piece that transforms any space into a haven of refinement and grace. Elevate your living experience with the embodiment of luxury—The Royal Majesty Sofa.\n',
      price: 7999000,
      location: 'Jakarta Barat',
      arUrl: 'Furniture Assets/Sofa/Sofa 2/sofa_web.glb',
      imgUrl: 'Furniture Assets/Sofa/Sofa 2/Sofa_2.jpg',
      category: Category.sofa,
      id: '2'),
  Furniture(
      title: 'Arctic Elegance Sofa',
      description:
          'Introducing the Arctic Elegance Sofa — a vision of contemporary sophistication in pristine white. This modern sofa transcends the ordinary, embodying a perfect blend of minimalist aesthetics and luxurious comfort, designed to transform your living space into a canvas of modern elegance.\n\nDraped in a lustrous, high-quality white fabric, the Arctic Elegance Sofa exudes an air of purity and refinement. The clean lines and unembellished silhouette capture the essence of modern design, creating a timeless piece that seamlessly integrates with various interior styles.\n\nThe Arctic Elegance Sofa is more than a visual statement; it\'s a sanctuary of comfort. Sink into its plush, generously padded cushions that offer a perfect balance between support and relaxation. The pristine white upholstery not only adds a touch of freshness but also serves as a versatile canvas, allowing you to play with colorful throw pillows or accessories to express your personal style.\n\nSupported by a sleek and sturdy frame, the Arctic Elegance Sofa stands as a symbol of modern functionality. Its raised profile and slender legs contribute to an illusion of space, making it an ideal choice for both compact urban apartments and spacious living rooms alike.\n\nThe Arctic Elegance Sofa invites you to embrace the tranquility and sophistication of white, creating a serene oasis within your home. Elevate your living space with this contemporary masterpiece — where modern design meets timeless comfort in a symphony of white perfection.\n',
      price: 5999000,
      location: 'Jakarta Barat',
      arUrl: 'Furniture Assets/Sofa/Sofa 3/modern__sofa.glb',
      imgUrl: 'Furniture Assets/Sofa/Sofa 3/Sofa_3.jpg',
      category: Category.sofa,
      id: '3'),
  Furniture(
      title: 'FlexFold Space Saver Table',
      description:
          'Introducing the FlexFold Space Saver Table — a versatile and innovative solution that seamlessly marries functionality with practical design. This folding table is engineered for the modern lifestyle, where adaptability and efficiency are paramount.\n\nCrafted with precision, the FlexFold features a durable yet lightweight frame that allows for effortless folding and unfolding. The sleek design, with its clean lines and contemporary aesthetics, makes it an ideal companion for spaces where flexibility is key, be it a compact apartment, a home office, or a dynamic work environment.\n\nThe tabletop of the FlexFold is a testament to both form and durability. Constructed from high-quality materials, it provides a smooth and spacious surface for various activities, from working on your laptop to enjoying a quick meal. The neutral tones and minimalist design ensure that the FlexFold seamlessly integrates into any decor scheme.\n\nWhat sets the FlexFold apart is its ingenious folding mechanism. With a simple and intuitive process, this table transforms effortlessly from a fully functional workspace to a conveniently storable unit. The compact folded form makes it easy to tuck away when not in use, allowing you to reclaim valuable space in an instant.\n\nWhether you\'re a minimalist enthusiast or someone looking to optimize their living or working area, the FlexFold Space Saver Table is designed to meet your needs. Embrace the freedom of adaptability with this contemporary folding table, where practicality meets style for the ultimate in modern living solutions.\n',
      price: 1999000,
      location: 'Jakarta Barat',
      imgUrl: 'Furniture Assets/Table/Folding Table/Folding_Table.jpg',
      arUrl: 'Furniture Assets/Table/Folding Table/folding_table.glb',
      category: Category.table,
      id: '4'),
  Furniture(
      title: 'TimberCraft Harvest Table',
      description:
          'Introducing the TimberCraft Harvest Table — a timeless centerpiece that brings the warmth and natural beauty of wood into your living space. Crafted with meticulous attention to detail, this wooden table is a celebration of the artistry inherent in fine woodworking.\n\nThe TimberCraft Harvest Table is made from high-quality, sustainable wood, showcasing the rich grains and textures that make each piece unique. The warm, earthy tones create an inviting atmosphere, transforming your dining area into a place of rustic charm and enduring elegance.\n\nThe tabletop, expertly finished to highlight the inherent beauty of the wood, serves as both a functional surface and a visual feast. Its generous size provides ample space for gatherings, whether it\'s a family dinner or a lively evening with friends, while the smooth finish invites touch and connection with the natural world.\n\nSupported by sturdy, handcrafted legs, the TimberCraft Harvest Table is a testament to the enduring strength and durability of wood. The natural variations in the grain pattern add character, making each table a one-of-a-kind work of art that stands the test of time.\n\nThis wooden table is not merely a piece of furniture; it\'s a statement of craftsmanship and a nod to the authenticity of natural materials. The TimberCraft Harvest Table invites you to embrace the simplicity and beauty of wood, creating a focal point that exudes warmth, comfort, and a connection to the timeless appeal of nature. Elevate your dining experience with the enduring elegance of the TimberCraft Harvest Table.\n',
      price: 1599000,
      location: 'Jakarta Barat',
      imgUrl: 'Furniture Assets/Table/Wooden Table/Wooden_Table.jpg',
      arUrl: 'Furniture Assets/Table/Wooden Table/wooden_table.glb',
      category: Category.table,
      id: '5'),
  Furniture(
      title: 'Executive ErgoCraft Office Chair',
      description:
          'Introducing the Executive ErgoCraft Office Chair — a pinnacle of comfort and functionality designed to elevate your workspace. This office chair is not merely a seat; it\'s a dynamic fusion of ergonomic excellence and contemporary style, tailored to meet the demands of the modern professional.\n\nThe Executive ErgoCraft features a sleek, high-back design upholstered in premium materials that blend sophistication with comfort. The supple yet durable leather or breathable fabric creates an inviting surface, while the carefully contoured backrest provides optimal lumbar support, promoting good posture and reducing fatigue during extended work sessions.\n\nEngineered for versatility, this office chair is equipped with a range of adjustable features. The pneumatic height adjustment ensures that the chair adapts seamlessly to your workspace, while the 360-degree swivel capability provides effortless mobility. The synchronized tilt mechanism with tension control allows you to recline comfortably, striking the perfect balance between relaxation and focus.\n\nThe Executive ErgoCraft\'s polished chrome or brushed metal accents add a touch of modern elegance, making it a stylish addition to any office decor. The five-star base with smooth-rolling casters ensures effortless movement across various floor surfaces, enhancing productivity without sacrificing style.\n\nBeyond its aesthetic appeal, this office chair is a testament to durability and craftsmanship. The robust construction and high-quality materials guarantee longevity, making it a wise investment for those who prioritize both style and substance in their professional environment.\n\nElevate your workspace with the Executive ErgoCraft Office Chair — where ergonomic excellence meets contemporary design, creating a harmonious blend of comfort and style to support your every work endeavor.\n',
      price: 199000,
      location: 'Jakarta Barat',
      imgUrl: 'Furniture Assets/Chair/Office Chair 1/Office_Chair.jpg',
      arUrl: 'Furniture Assets/Chair/Office Chair 1/office_chair.glb',
      category: Category.chair,
      id: '6'),
  Furniture(
      title: 'Heritage Craft Wooden Chair',
      description:
          'Introducing the Heritage Craft Wooden Chair — a timeless piece that seamlessly combines craftsmanship, comfort, and the natural beauty of wood. This chair is a nod to classic design principles, inviting you to experience the charm and enduring elegance that only solid wood can provide.\n\nCrafted from sustainably sourced hardwood, the Heritage Craft Wooden Chair showcases the exquisite grains and warm hues inherent to the material. The smooth, polished finish not only enhances the visual appeal but also invites you to appreciate the tactile richness of the wood, creating a connection with the authenticity of nature.\n\nThe design of the Heritage Craft chair is a marriage of simplicity and sophistication. The gracefully curved backrest provides ergonomic support, while the subtly contoured seat offers a comfortable and inviting place to sit. The back and seat may be finished in a complementary stain or left natural, allowing you to customize the chair to suit your personal style.\n\nSupported by sturdy legs, each chair is a testament to the enduring strength of wood. Whether used as a standalone accent piece or as part of a dining set, the Heritage Craft Wooden Chair adds a touch of rustic charm to any space, from traditional to contemporary.\n\nThis wooden chair is not just furniture; it\'s a statement of quality craftsmanship and a celebration of the inherent beauty of natural materials. The Heritage Craft Wooden Chair invites you to slow down, savor the simplicity of design, and relish in the timeless appeal of a well-crafted wooden seat. Enrich your space with the classic elegance of the Heritage Craft Wooden Chair.\n',
      price: 399000,
      location: 'Jakarta Barat',
      imgUrl: 'Furniture Assets/Chair/Wooden Chair 1/Wooden_Chair.jpg',
      arUrl: 'Furniture Assets/Chair/Wooden Chair 1/rustic_chair (1).glb',
      category: Category.chair,
      id: '7'),
  Furniture(
      title: 'Bean Bliss Pro Coffee Maker',
      description:
          'Introducing the Bean Bliss Pro Coffee Maker — where precision meets simplicity to redefine your daily coffee ritual. This state-of-the-art coffee maker is designed to elevate your brewing experience, delivering a perfect cup of coffee with every pour.\n\nThe Bean Bliss Pro boasts a sleek and modern design that seamlessly integrates into any kitchen aesthetic. Its brushed stainless steel exterior not only adds a touch of sophistication but also ensures durability and longevity, making it a standout appliance on your countertop.\n\nAt the heart of the Bean Bliss Pro is a powerful brewing system that combines technology and innovation. The precision temperature control guarantees that your coffee grounds are steeped at the optimal temperature for the perfect extraction, unlocking the full spectrum of flavors and aromas.\n\nChoose your preferred brewing strength with the customizable settings, whether you crave a bold espresso or a milder morning cup. The intuitive control panel, adorned with an easy-to-read LED display, puts the power of barista-quality coffee at your fingertips.\n\nThe Bean Bliss Pro is designed for convenience without compromising on quality. The large, transparent water reservoir lets you monitor water levels, while the removable parts make for easy cleaning. The built-in grinder ensures that your coffee beans are freshly ground just before brewing, preserving the essence of every bean.\n\nWhether you\'re a coffee connoisseur or someone who appreciates a quick and reliable brew, the Bean Bliss Pro Coffee Maker is your ticket to a consistently exceptional coffee experience. Start your day right with the perfect cup, crafted by the precision and elegance of the Bean Bliss Pro.\n',
      price: 599000,
      location: 'Jakarta Barat',
      imgUrl: 'Furniture Assets/Kitchen/Coffee maker 1/Coffee_Maker.jpg',
      arUrl: 'Furniture Assets/Kitchen/Coffee maker 1/coffee_maker.glb',
      category: Category.kitchen,
      id: '8'),
  Furniture(
      title: 'Regal Dreams King Bed',
      description:
          'Introducing the Regal Dreams King Bed — a sanctuary of luxury and comfort that transforms your bedroom into a haven of opulence. This king-sized bed is not just a piece of furniture; it\'s a statement of grandeur and sophistication designed for those who seek the ultimate in restful indulgence.\n\nThe Regal Dreams bed frame, crafted with meticulous attention to detail, features a majestic headboard that commands attention. Upholstered in sumptuous, high-quality fabric or luxurious leather, it exudes a sense of timeless elegance. The button-tufted or channel-tufted detailing adds a touch of regality, creating a focal point that anchors your bedroom with unparalleled style.\n\nThe king-sized sleeping platform is generously proportioned, providing an expansive oasis for rest and relaxation. Whether you\'re stretching out solo or sharing the space with a partner, the Regal Dreams King Bed offers an abundance of room for undisturbed sleep, ensuring a truly royal experience every night.\n\nCrafted for durability and longevity, the bed frame stands on sturdy, finely detailed legs or a solid base, ensuring stability and support. The meticulous craftsmanship extends to every corner, creating a seamless blend of form and function that defines luxury living.\n\nThe Regal Dreams King Bed isn\'t just about aesthetics; it\'s about creating an immersive sleep experience. The bed\'s design is not only visually striking but also ergonomically thoughtful, ensuring that every moment spent in its embrace is one of comfort, luxury, and tranquility.\n\nTransform your bedroom into a palace of dreams with the Regal Dreams King Bed — where style meets substance, and every night is an invitation to indulge in the grandeur of restful luxury.\n',
      price: 7999000,
      location: 'Jakarta Utara',
      imgUrl: 'Furniture Assets/Bed/Bed 1/Bed_1.jpg',
      arUrl: 'Furniture Assets/Bed/Bed 1/bed.glb',
      category: Category.bed,
      id: '9'),
  Furniture(
      title: 'SoloLounger',
      description:
          'Indulge in the epitome of personal relaxation with our SoloLounger, a meticulously crafted single-person sofa designed to elevate your lounging experience to new heights. This sleek and stylish piece seamlessly combines modern aesthetics with unparalleled comfort, making it the perfect addition to any contemporary living space.\n\nFeatures:\n\n1. Compact Design: The SoloLounger boasts a space-efficient design, making it an ideal choice for cozy apartments, reading nooks, or any corner of your home where you seek solace.\n\n2. Plush Upholstery: Sink into luxury with the sumptuous, high-density foam cushions that cradle your body in blissful comfort. The premium upholstery, available in a range of sophisticated colors and textures, adds a touch of elegance to your space.\n\n3. Versatile Functionality: Whether you\'re unwinding with a good book, catching up on your favorite show, or simply taking a moment to relax, the SoloLounger is your versatile companion. Its ergonomic design provides optimal support for extended periods of sitting.\n\n4. Quality Craftsmanship: Meticulously crafted with attention to detail, the SoloLounger is built to last. The sturdy frame ensures durability, while the carefully selected materials guarantee a luxurious feel that stands the test of time.\n\n5. Customizable Options: Tailor the SoloLounger to your personal taste with our customizable options. Choose from a variety of upholstery materials, colors, and leg finishes to create a sofa that reflects your unique style.\n\n6. Easy Maintenance: Life is busy, and we understand the need for convenience. The SoloLounger is designed for easy maintenance, with removable and washable cushion covers that ensure your sofa stays fresh and inviting.\n\n7. Thoughtful Dimensions: The SoloLounger strikes the perfect balance between form and function. Its thoughtfully proportioned dimensions provide a cozy yet spacious seat, allowing you to unwind without compromising on style.\n\nInvest in your well-being with the SoloLounger-a single-person sofa that redefines comfort and style. Create your personal oasis and embrace moments of solitude with this exquisite addition to your home.\n',
      price: 999000,
      location: 'Jakarta Timur',
      imgUrl: 'Furniture Assets/Sofa/Sofa 4/Sofa_4.jpg',
      arUrl: 'Furniture Assets/Sofa/Sofa 4/sofa.glb',
      category: Category.sofa,
      id: '10'),
  Furniture(
      title: 'TitanCraft Industrial Table',
      description:
          'Introducing the TitanCraft Industrial Table: Rugged Elegance for Your Workspace.\n\nExperience the perfect fusion of robust durability and sleek design with our TitanCraft Industrial Table. Crafted for both style and practicality, this table is a bold statement piece designed to elevate your workspace..\n\nKey Features:.\n\nIndustrial Chic: The TitanCraft Industrial Table boasts a striking design that effortlessly combines rugged aesthetics with a touch of urban elegance..\n\nSteel Frame Construction: Built to withstand the demands of a dynamic workspace, the sturdy steel frame provides unwavering support for your projects..\n\nWeathered Finish: The table features a weathered finish that adds character and authenticity, telling a story of resilience and strength..\n\nGenerous Workspace: With a spacious surface, the TitanCraft offers plenty of room for your work, whether you\'re sketching out ideas, working on DIY projects, or collaborating with others..\n\nVersatile Use: Ideal for workshops, studios, or home offices, this table adapts to various environments, seamlessly blending industrial flair with practical functionality..\n\nEasy Assembly: Simple and straightforward assembly ensures you can enjoy your TitanCraft Industrial Table without unnecessary hassle.\n\nUpgrade your workspace with the TitanCraft Industrial Table-where industrial toughness meets refined style for a truly inspiring work environment.\n',
      price: 699000,
      location: 'Jakarta Barat',
      imgUrl: 'Furniture Assets/Table/Industrial Table/Industrial_Table.jpg',
      arUrl: 'Furniture Assets/Table/Industrial Table/industrial_table.glb',
      category: Category.table,
      id: '11'),
  Furniture(
      title: 'UltraDesk Compact Desktop Table',
      description:
          'Introducing the UltraDesk Compact Desktop Table: Streamlined Efficiency for Your Workspace\n\nExperience the perfect blend of form and function with our UltraDesk Compact Desktop Table. Designed to optimize your workspace, this sleek and versatile table is crafted with modern aesthetics and practical functionality in mind.\n\nKey Features:\n\nSpace-Saving Design: The UltraDesk is tailored for efficiency, offering a compact footprint that maximizes your available space. Perfect for home offices, studios, or any area where space is at a premium.\n\nContemporary Elegance: With clean lines and a minimalist design, the UltraDesk brings a touch of contemporary elegance to your workspace. Its neutral color palette complements any décor, creating a harmonious atmosphere.\n\nSturdy Construction: Built with durability in mind, the table features a robust frame that ensures stability during your daily tasks. Quality materials guarantee a reliable and long-lasting addition to your workspace.\n\nAmple Desktop Surface: Despite its compact size, the UltraDesk provides ample desktop space for your computer, accessories, and work essentials. Enjoy a clutter-free environment that promotes focus and productivity.\n\nCable Management: Tired of tangled cables? The UltraDesk comes equipped with integrated cable management, keeping your workspace organized and free from unsightly wire clutter.\n\nEasy Assembly: Designed for hassle-free setup, the UltraDesk comes with straightforward assembly instructions, allowing you to enjoy your new workspace solution in no time.\n\nUpgrade your work area with the UltraDesk Compact Desktop Table—a stylish and efficient solution that enhances your productivity and complements your modern lifestyle.\n',
      price: 399000,
      location: 'Jakarta Barat',
      imgUrl: 'Furniture Assets/Table/Desktop Table/Desktop_Table.jpg',
      arUrl: 'Furniture Assets/Table/Desktop Table/computer_desk.glb',
      category: Category.table,
      id: '12'),
  Furniture(
      title: 'ErgoRelax Ergonomic Chair',
      description:
          'Introducing the ErgoRelax Ergonomic Chair: Elevate Your Comfort, Enhance Your Posture\n\nTransform your seating experience with the ErgoRelax Lumbar-Support Chair—a revolutionary ergonomic solution crafted to prioritize your well-being during long hours of work or study. Say goodbye to discomfort and hello to a chair designed for the health-conscious individual.\n\nKey Features:\n\nOptimized Lumbar Support: The ErgoRelax Chair is meticulously engineered to provide exceptional lumbar support, promoting a healthy spine alignment. Its contoured design ensures that your lower back is cradled, reducing strain and preventing the onset of discomfort.\n\nAdjustable Ergonomics: Customize your seating experience with a range of adjustable features. The chair offers height adjustment, tilt control, and adjustable armrests, allowing you to tailor the chair to your body\'s unique needs and maintain an ergonomic posture throughout the day.\n\nPremium Comfort Materials: Sink into a seat of luxury with high-density foam padding and breathable, durable upholstery. The chair\'s materials are selected for their comfort and longevity, ensuring a supportive and cozy experience even during extended sitting sessions.\n\nStylish Design: The ErgoRelax combines ergonomic functionality with a sleek, modern design. Its clean lines and contemporary aesthetic make it a sophisticated addition to any office, home workspace, or study environment.\n\nVersatile Usage: Whether you\'re working, studying, or gaming, the ErgoRelax adapts to your needs. This versatile chair is designed for multi-functional use, providing comfort and support in various settings.\n\nSturdy Construction: Built to last, the chair features a robust frame and high-quality materials. The sturdy base and smooth-rolling casters ensure both stability and mobility, allowing you to move effortlessly throughout your workspace.\n\nInvest in your well-being with the ErgoRelax Lumbar-Support Chair—a commitment to comfort, posture, and a healthier, more productive you. Redefine your seating experience with a chair that cares for your body as much as you do.\n',
      price: 799000,
      location: 'Pekanbaru',
      imgUrl: 'Furniture Assets/Chair/Ergonomic Chair/Ergonomic_Chair.jpg',
      arUrl:
          'Furniture Assets/Chair/Ergonomic Chair/ergonomic_mesh_office_chair.glb',
      category: Category.chair,
      id: '13'),
  Furniture(
      title: 'EliteGamer Pro Series Gaming Chair',
      description:
          'Introducing the EliteGamer Pro Series Gaming Chair: Unleash Your Gaming Potential in Comfort and Style\n\nElevate your gaming experience with the EliteGamer Pro Series Gaming Chair, a premium seat designed for gamers who demand superior comfort, durability, and style. This cutting-edge chair is not just a place to sit; it\'s a command center for your gaming adventures.\n\nKey Features:\n\nUltimate Comfort: Immerse yourself in the game for hours without fatigue. The EliteGamer Pro Series features high-density foam padding, lumbar support, and a contoured design to keep you comfortable during intense gaming sessions.\n\nPro-Grade Ergonomics: Engineered with gamers in mind, the chair offers adjustable armrests, a reclining feature, and customizable lumbar and headrest cushions. Achieve the perfect ergonomic setup for your unique gaming style.\n\nDurable Construction: Built to withstand the rigors of gaming, the chair\'s robust steel frame and high-quality PU leather upholstery ensure long-lasting durability. The sturdy base and smooth-rolling casters provide stability and mobility.\n\nImmersive Design: The EliteGamer Pro Series doesn\'t just provide comfort; it makes a statement. With bold, eye-catching design elements, including customizable color options and sleek lines, it\'s a stylish addition to any gaming setup.\n\nIntegrated Technology: Level up your gaming experience with built-in features like audio speakers, vibration motors, and connectivity options. Immerse yourself in the action with a chair that brings your games to life.\n\nEasy Assembly: Get into the game quickly with straightforward assembly instructions. The EliteGamer Pro Series is designed for easy setup, so you can focus on what matters—dominating the virtual battlefield.\n\nUnleash the full potential of your gaming experience with the EliteGamer Pro Series Gaming Chair. Upgrade your setup, embrace comfort, and conquer your virtual worlds in style.\n',
      price: 1399000,
      location: 'Jakarta Barat',
      imgUrl: 'Furniture Assets/Chair/Gaming Chair/Gaming Chair.jpg',
      arUrl: 'Furniture Assets/Chair/Gaming Chair/gaming_chair.glb',
      category: Category.chair,
      id: '14'),
  Furniture(
      title: 'Bed Haven',
      description:
          'Welcome to Bed Haven, where dreams take center stage and restful nights are crafted. In this curated collection, we present an array of meticulously designed beds that redefine the concept of comfort and style in the realm of slumber. From contemporary chic to timeless elegance, each bed in our assortment reflects a commitment to quality craftsmanship and a dedication to providing you with the ultimate sleep sanctuary.\n\nExplore our range of platform beds, adorned with clean lines and minimalist aesthetics, perfect for those who appreciate a modern touch in their bedroom retreat. Indulge in the luxurious embrace of our upholstered beds, where plush fabrics and sophisticated details come together to create an atmosphere of opulence and serenity. For those seeking a harmonious blend of form and function, our storage beds offer cleverly integrated solutions to keep your space organized without compromising on elegance.\n\nDiscover the transformative power of a canopy bed, where the timeless allure of draped fabric meets contemporary design for a truly regal experience. Our selection of metal and wooden bed frames provides a diverse palette of styles to suit your taste, whether you prefer the warmth of rustic charm or the cool, sleek lines of industrial design.\n\nAt Bed Haven, we understand that a bed is not just a piece of furniture; it\'s a personal haven where rejuvenation begins. Each bed in our collection is a testament to our commitment to creating an environment where you can rest, rejuvenate, and wake up ready to embrace a new day. Dive into our Bed Haven and let your journey to dreamland begin.\n',
      price: 1999000,
      location: 'Jakarta Barat',
      imgUrl: '/Furniture Assets/Bed/Bed 2/Bed 2.jpg',
      arUrl: '/Furniture Assets/Bed/Bed 2/bed.glb',
      category: Category.bed,
      id: '15'),
  Furniture(
      title: 'SwiftHeat Pro Microwave',
      description:
          'Introducing the SwiftHeat Pro Microwave – a kitchen marvel designed to redefine your cooking and reheating experience. This state-of-the-art appliance seamlessly blends contemporary style with unparalleled functionality, making it the perfect addition to any modern kitchen. With a generous capacity and 1200 watts of power, the SwiftHeat Pro Microwave ensures quick and efficient cooking for even the busiest lifestyles.\n\nFeaturing an intuitive control panel, this microwave offers a plethora of pre-programmed settings for popular dishes, from popcorn to pasta, taking the guesswork out of meal preparation. The advanced sensor technology adapts cooking time and power levels based on the moisture content of your food, guaranteeing perfectly cooked results every time. The sleek, stainless steel exterior not only adds a touch of elegance to your kitchen but also ensures durability and easy cleaning.\n\nWith the convenience of express cooking and a time-saving quick-start function, the SwiftHeat Pro Microwave puts you in control of your culinary creations. The defrost function is perfect for thawing frozen ingredients effortlessly, while the child lock feature provides peace of mind for households with little ones. Elevate your kitchen efficiency and embrace a new era of cooking convenience with the SwiftHeat Pro Microwave – where innovation meets simplicity for delicious results at the touch of a button.\n',
      price: 759000,
      location: 'Jakarta Barat',
      imgUrl: 'Furniture Assets/Kitchen/Microwave/Microwave.jpg',
      arUrl: 'Furniture Assets/Kitchen/Microwave/microwave_oven.glb',
      category: Category.kitchen,
      id: '16'),
  Furniture(
      title: 'Deluxe ToastMaster Pro',
      description:
          'Introducing the Deluxe ToastMaster Pro, a revolutionary toaster that elevates your breakfast experience to new heights. Designed with precision and sophistication, this sleek appliance seamlessly combines cutting-edge technology with timeless functionality. The ToastMaster Pro features extra-wide slots, accommodating a variety of bread types, from artisanal sourdough to hearty whole wheat. Equipped with an intelligent browning control system, you can customize your toast to perfection, whether you prefer a golden crisp or a warm, soft center.\n\nSay goodbye to uneven toasting with our advanced even-toast technology, ensuring consistent browning across every inch of your bread. The toaster also boasts a convenient defrost function for frozen pastries and a reheat option to warm up toast without additional browning. The cool-touch exterior provides safety and peace of mind, while the removable crumb tray makes cleanup a breeze. The Deluxe ToastMaster Pro isn\'t just a toaster; it\'s a culinary companion that brings artistry to your kitchen, ensuring your mornings start with a delightful crunch. Elevate your breakfast ritual with the unparalleled performance and style of the Deluxe ToastMaster Pro - because every slice deserves perfection.',
      price: 399000,
      location: 'Jakarta Barat',
      imgUrl: 'Furniture Assets/Kitchen/Toaster 1/Toaster.jpg',
      arUrl: 'Furniture Assets/Kitchen/Toaster 1/toaster.glb',
      category: Category.kitchen,
      id: '17'),
];

List<CategTypes> categoryTypeAssets = [
  CategTypes(
    title: 'Sofa',
    icons: const FaIcon(FontAwesomeIcons.couch, color: Colors.white),
    category: Category.sofa,
  ),
  CategTypes(
    title: 'Table',
    icons: const FaIcon(Icons.table_bar_sharp, color: Colors.white),
    category: Category.table,
  ),
  CategTypes(
    title: 'Chair',
    icons: const FaIcon(FontAwesomeIcons.chair, color: Colors.white),
    category: Category.chair,
  ),
  CategTypes(
    title: 'Kitchen',
    icons: const FaIcon(FontAwesomeIcons.kitchenSet, color: Colors.white),
    category: Category.kitchen,
  ),
  CategTypes(
    title: 'Bed',
    icons: const FaIcon(FontAwesomeIcons.bed, color: Colors.white),
    category: Category.bed,
  ),
  CategTypes(
    title: 'Coming Soon',
    icons: const FaIcon(FontAwesomeIcons.gear, color: Colors.white),
    category: Category.none,
  )
];

List<Cart> cardAssets = [
  Cart(furniture: furnitureAssets[0], amount: 2, onChecked: false)
];

// sofa1: https://drive.google.com/uc?export=download&id=1AMB175zaNpOlZPqX0RbMJGDSotsqZ9LO
// sofa2: https://drive.google.com/uc?export=download&id=1IBM1gybvVwH2rsjhaPIQjqG7zd9wJO6k
// sofa3: https://drive.google.com/uc?export=download&id=1I5NKHr5y8o7wMvaSjKGUR_o3HW8TF39q
// Folding Table 1: https://drive.google.com/uc?export=download&id=1PBS31nxoz1wvXF_x1tMlWOZ-ftvh7122
// Wooden Table 1: https://drive.google.com/uc?export=download&id=1ePtKlObZ8oMG7_-X5nhzOAW8mfO7mIod
// Office Chair 1: https://drive.google.com/uc?export=download&id=1eJhSm0DRjJ2hKZ0MUJgUzlkJ303QNBqG
// Wooden Chair 1: https://drive.google.com/uc?export=download&id=1ePtKlObZ8oMG7_-X5nhzOAW8mfO7mIod
// Coffee maker: https://drive.google.com/uc?export=download&id=1lWfTt42SdD6ahSQLmEwa3kKdgP29VKzV
// Bed 1: https://drive.google.com/uc?export=download&id=1pKuArMEIa7Tkb4BXTq1fZ0bodGJIf300
