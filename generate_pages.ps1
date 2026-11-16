# PowerShell Script to generate full static website for 萊渼國際貿易有限公司
# Phone number updated to (02)8953-5096 across all pages
$ErrorActionPreference = "Stop"

$Company = @{
    Name = "萊渼國際貿易有限公司"
    NameEn = "LAIMEI INTERNATIONAL TRADE CO., LTD."
    Brand = "LENOR HERBAL 萊渼生化草本美肌"
    Address = "新北市板橋區信義路117號5樓"
    Tel = "(02)8953-5096"
    Fax = "(02)8953-5119"
    Hours = "週一至週五 09:00 - 18:00 (國定例假日休息)"
}

$Products = @(
    # 1. 清潔系列
    @{
        Name = "舒淨洗卸兩用"
        FileName = "舒淨洗卸兩用.html"
        Series = "清潔系列"
        SeriesKey = "cleanse"
        Volume = "200 ml"
        Image = "images/舒淨洗卸兩用.jpg"
        Ingredients = @("氨基酸洗顏成份", "天然角鯊烯", "洋甘菊萃取液", "款冬萃取液", "丙二醇")
        Efficacy = "清潔肌膚。溫和卸除臉部淡妝與毛孔髒汙，深層潔淨同時保護皮脂膜，洗後清爽水潤不緊繃。"
        Usage = "取適量置於手中，加少量水揉搓出泡沫，在臉上輕輕按摩，再以清水洗去。"
        SkinType = "敏感、乾性肌膚。"
        Desc = "專為敏弱與乾燥肌膚研發，結合氨基酸親膚洗顏與天然角鯊烯滋潤保護，洗顏、卸妝一次完成。"
        Featured = $true
    },
    @{
        Name = "舒淨洗卸兩用_沙貨"
        FileName = "舒淨洗卸兩用_沙貨.html"
        Series = "清潔系列"
        SeriesKey = "cleanse"
        Volume = "500 ml / 1000 ml"
        Image = "images/舒淨洗卸兩用_沙貨.jpg"
        Ingredients = @("氨基酸洗顏成份", "高純度角鯊烯", "洋甘菊精萃", "款冬萃取液", "植萃保濕醇")
        Efficacy = "美容沙龍專業沙貨大容量包裝。極致溫和深層卸妝洗顏，保護脆弱角質層，沙龍護膚第一步驟首選。"
        Usage = "取適量置於掌心揉出綿密泡沫，在全臉打圈按摩後以清水清洗乾淨。"
        SkinType = "沙龍專業療程、敏感、乾燥肌膚。"
        Desc = "沙龍專用大容量舒淨洗卸兩用，專業美容師指定回購第一名。"
        Featured = $false
    },
    @{
        Name = "青春淨顏乳"
        FileName = "青春淨顏乳.html"
        Series = "清潔系列"
        SeriesKey = "cleanse"
        Volume = "150 ml"
        Image = "images/青春淨顏乳.jpg"
        Ingredients = @("胺基酸介面活性劑", "金縷梅萃取", "白柳樹皮精華", "茶樹精萃")
        Efficacy = "深層淨化多餘油脂與毛孔粉刺，維持肌膚水油平衡，洗後水潤柔嫩不緊繃。"
        Usage = "取適量於手心，加少量水揉搓起泡後塗抹於濕潤臉部，輕柔畫圓按摩後以溫水洗淨。"
        SkinType = "油性、混合性及易泛油光粉刺肌膚。"
        Desc = "淨化毛孔多餘油脂，帶走深層汙垢，維持肌膚細緻柔嫩狀態。"
        Featured = $false
    },
    @{
        Name = "海藻角質凝露"
        FileName = "海藻角質凝露.html"
        Series = "清潔系列"
        SeriesKey = "cleanse"
        Volume = "120 ml"
        Image = "images/海藻角質凝露.jpg"
        Ingredients = @("天然深海紅藻精華", "木瓜酵素", "甘草酸鉀", "蘆薈多醣體")
        Efficacy = "溫和軟化老廢角質，去除粗糙暗沉，撫平肌膚紋理，重現細緻晶瑩透亮膚質。"
        Usage = "臉部清潔後拭乾水分，取適量均勻塗抹於臉部，輕輕搓揉打圈，再以清水充分洗淨。"
        SkinType = "全膚質適用，特別推薦暗沉粗糙肌膚每週使用 1-2 次。"
        Desc = "富含海洋藻類微量元素與保濕多醣體，溫和代謝角質不傷肌膚屏障。"
        Featured = $false
    },

    # 2. 調理系列
    @{
        Name = "賦活晶瑩眼露"
        FileName = "賦活晶瑩眼露.html"
        Series = "調理系列"
        SeriesKey = "condition"
        Volume = "30 ml"
        Image = "images/賦活晶瑩眼露.jpg"
        Ingredients = @("咖啡因多肽", "深海海洋膠原蛋白", "七葉樹萃取", "眼周微循環因子")
        Efficacy = "改善眼周暗沉黑眼圈，緊緻眼袋浮腫，淡化乾燥細紋，恢復雙眸晶瑩神采。"
        Usage = "取米粒大小於無名指腹，輕輕點壓於眼周肌膚，由內向外輕撫至吸收。"
        SkinType = "眼周乾燥、暗沉、細紋浮腫肌膚。"
        Desc = "清爽凝露質地，零油脂負擔，不易生成肉芽脂肪粒。"
        Featured = $false
    },
    @{
        Name = "玻尿酸原液"
        FileName = "玻尿酸原液.html"
        Series = "調理系列"
        SeriesKey = "condition"
        Volume = "50 ml"
        Image = "images/玻尿酸原液.jpg"
        Ingredients = @("高分子玻尿酸", "小分子滲透型玻尿酸", "聚麩胺酸(γ-PGA)", "維生素B5")
        Efficacy = "高濃度立體水網結構，形成透氣鎖水保護膜，改善乾燥脫屑，使肌膚飽滿水嫩。"
        Usage = "潔面並使用化妝水後，取 2-3 滴塗抹於全臉，輕拍按摩至吸收。"
        SkinType = "極度乾渴、缺水、醫美後修護等所有膚質。"
        Desc = "純淨水感原液，長效抓水、補水、鎖水三合一強效保濕。"
        Featured = $true
    },

    # 3. 重點精華保養系列
    @{
        Name = "仙人掌保濕精華露"
        FileName = "仙人掌保濕精華露.html"
        Series = "重點精華保養系列"
        SeriesKey = "serum"
        Volume = "50 ml"
        Image = "images/仙人掌保濕精華露.jpg"
        Ingredients = @("沙漠仙人掌莖萃取", "神經醯胺", "鎖水磁石PENTAVITIN", "白茅根萃取")
        Efficacy = "強韌肌膚屏障，抵禦極端氣候乾燥，維持長達72小時澎潤水嫩光澤。"
        Usage = "早晚使用於化妝水後，取適量均勻塗抹於臉頰與頸部，輕壓至吸收。"
        SkinType = "乾燥脫皮、換季乾癢、長期待在冷氣房之肌膚。"
        Desc = "汲取沙漠耐旱奇蹟能量，為肌底注入源源不絕的澎湃活水。"
        Featured = $false
    },
    @{
        Name = "3D嫩白精華液"
        FileName = "3D嫩白精華液.html"
        Series = "重點精華保養系列"
        SeriesKey = "serum"
        Volume = "30 ml"
        Image = "images/3D嫩白精華液.jpg"
        Ingredients = @("高穩定型乙基維他命C", "熊果素", "菸鹼醯胺(Vitamin B3)", "阿魏酸亮白因子")
        Efficacy = "3D立體亮白網絡，有效抑制黑色素沉澱，淡化暗沉痘印，改善蠟黃，綻放透亮發光肌。"
        Usage = "夜間保養時取 3-4 滴均勻塗抹全臉，日間使用請務必搭配隔離防曬乳。"
        SkinType = "膚色不均、暗沉無光、色斑瑕疵肌膚。"
        Desc = "高活性3D光感美白精萃，掃除深層暗沉，喚醒原生透明感。"
        Featured = $true
    },
    @{
        Name = "魚子松露活膚精華"
        FileName = "魚子松露活膚精華.html"
        Series = "重點精華保養系列"
        SeriesKey = "serum"
        Volume = "40 ml"
        Image = "images/魚子松露活膚精華.jpg"
        Ingredients = @("頂級黑鱘魚子精華", "黑松露多酚", "三胜肽抗老複方", "微量礦物群")
        Efficacy = "賦活肌底細胞能量，抵禦老化與自由基，深層撫平細紋，賦予緊實飽滿彈力。"
        Usage = "精華步驟取適量於手心溫熱後，順著肌膚紋理向上拉提按摩至吸收。"
        SkinType = "熟齡肌、鬆弛、缺乏彈性及老化初現肌膚。"
        Desc = "極奢賦活逆齡精萃，啟動肌膚深層再生機制，綻放緊緻光芒。"
        Featured = $true
    },
    @{
        Name = "水光針"
        FileName = "水光針.html"
        Series = "重點精華保養系列"
        SeriesKey = "serum"
        Volume = "10 ml x 3支"
        Image = "images/水光針.jpg"
        Ingredients = @("高純度塗抹式水光精華", "寡胜肽-1", "交聯玻尿酸鈉", "富勒烯")
        Efficacy = "媲美醫美級塗抹水光療程，瞬間為肌底灌注高濃度水光因子，撫平乾紋，煥發水光鏡面透亮。"
        Usage = "輕推水光針劑管，取適量滴於手心或直接點塗臉部，輕拍直至肌膚吸收發亮。"
        SkinType = "急救補水、醫美後修護、極度乾癟粗糙無光澤肌膚。"
        Desc = "沙龍與名媛必備塗抹水光針，一抹立現水潤玻璃肌感。"
        Featured = $true
    },

    # 4. 日夜滋潤修護系列
    @{
        Name = "潤采滋養活膚乳"
        FileName = "潤采滋養活膚乳.html"
        Series = "日夜滋潤修護系列"
        SeriesKey = "repair"
        Volume = "100 ml"
        Image = "images/潤采滋養活膚乳.jpg"
        Ingredients = @("乳木果油", "天然角鯊烷", "白池花籽油", "神經醯胺NP")
        Efficacy = "提供乾燥肌膚深層滋養，修護表皮角質防禦膜，防止水分散失，長時間柔嫩光滑。"
        Usage = "早晚精華液後，取適量均勻塗抹於臉部及頸部，輕揉推勻至吸收。"
        SkinType = "中性偏乾、乾性及熟齡缺油肌膚。"
        Desc = "絲滑乳液質地，滋養不油膩，賦予肌膚柔嫩細緻的奢華光感。"
        Featured = $false
    },
    @{
        Name = "嫩白日晚霜"
        FileName = "嫩白日晚霜.html"
        Series = "日夜滋潤修護系列"
        SeriesKey = "repair"
        Volume = "50 g"
        Image = "images/嫩白日晚霜.jpg"
        Ingredients = @("傳明酸", "維他命C磷酸鎂鹽(MAP)", "雪絨花萃取", "荷荷芭油")
        Efficacy = "日間抵禦氧化暗沉，夜間深層淨白淡斑，日夜接力實現透白均勻美肌。"
        Usage = "每日早晚基礎保養最後一步，取珍珠大小塗抹於全臉並輕拍按摩。"
        SkinType = "暗沉、斑點、膚色不勻及曬後需美白修護肌膚。"
        Desc = "24小時雙效美白鎖水滋潤，改善斑點沉澱，煥發水感晶透光芒。"
        Featured = $false
    },
    @{
        Name = "海洋元素"
        FileName = "海洋元素.html"
        Series = "日夜滋潤修護系列"
        SeriesKey = "repair"
        Volume = "50 ml"
        Image = "images/海洋元素.jpg"
        Ingredients = @("布列塔尼深海微藻精粹", "海洋活泉水", "墨角藻萃取", "海洋膠原")
        Efficacy = "深層賦活疲勞肌底，提升肌膚防禦力，注入豐富礦物微量元素，飽滿回彈。"
        Usage = "早晚乳液後或精華步驟使用，取適量均勻塗抹於臉部。"
        SkinType = "經常熬夜、生活壓力大、膚色疲倦無光澤者。"
        Desc = "濃縮深海礦物能量，一抹化水，深層修復肌膚微循環與生命力。"
        Featured = $false
    },
    @{
        Name = "魔滴水膚凝霜"
        FileName = "魔滴水膚凝霜.html"
        Series = "日夜滋潤修護系列"
        SeriesKey = "repair"
        Volume = "50 g"
        Image = "images/魔滴水膚凝霜.jpg"
        Ingredients = @("微囊爆水科技微粒", "多重寡胜肽", "積雪草苷", "冰川海茴香")
        Efficacy = "接觸肌膚瞬間化為澎湃水珠，秒速滲透肌底，清爽零黏膩，長效沁涼保濕。"
        Usage = "於保養最後一道程序，取適量輕拍塗抹，享受爆水保濕膚觸。"
        SkinType = "油性肌膚、外油內乾、混合肌及夏季悶熱氣候適用。"
        Desc = "革命性凝水轉化技術，如凝水薄膜般鎖住滿滿水分子。"
        Featured = $true
    },
    @{
        Name = "澤肌嫩白精華霜"
        FileName = "澤肌嫩白精華霜.html"
        Series = "日夜滋潤修護系列"
        SeriesKey = "repair"
        Volume = "50 g"
        Image = "images/澤肌嫩白精華霜.jpg"
        Ingredients = @("水解珍珠蛋白", "九胜肽亮白因子", "天然紅沒藥醇", "山茶花油")
        Efficacy = "淡化色素沉著，修飾粗大毛孔，深度亮白保濕，使肌膚如珍珠般溫潤光潔。"
        Usage = "夜間保養時取適量均勻塗抹於全臉，加強斑點暗沉處按摩。"
        SkinType = "乾燥暗沉、色斑瑕疵肌膚。"
        Desc = "珍珠光澤精萃與胜肽亮白成分完美揉合，養出無瑕玉質肌。"
        Featured = $false
    },
    @{
        Name = "多元胜肽緊緻霜"
        FileName = "多元胜肽緊緻霜.html"
        Series = "日夜滋潤修護系列"
        SeriesKey = "repair"
        Volume = "50 g"
        Image = "images/多元胜肽緊緻霜.jpg"
        Ingredients = @("五胜肽", "八胜肽", "三胜肽修護因子", "澳洲堅果籽油")
        Efficacy = "緊緻臉部下顎線條，淡化深層抬頭紋、木偶紋，提升肌膚豐潤彈性與厚度。"
        Usage = "晚間保養程序中，取適量配合由下而上提拉手法按摩臉部與頸部。"
        SkinType = "鬆弛下垂、出現深層靜態紋路及熟齡肌膚。"
        Desc = "高階抗衰老胜肽面霜，緊緻塑顏，對抗地心引力老化痕跡。"
        Featured = $false
    },
    @{
        Name = "美美淨痘"
        FileName = "美美淨痘.html"
        Series = "日夜滋潤修護系列"
        SeriesKey = "repair"
        Volume = "30 g"
        Image = "images/美美淨痘.jpg"
        Ingredients = @("水楊酸", "澳洲茶樹精油", "繖花醇(IPMP)", "尿囊素")
        Efficacy = "溫和代謝毛孔粉刺，舒緩紅腫發炎痘痘，調節皮脂過剩分泌，預防痘疤形成。"
        Usage = "潔面後取適量點塗於痘痘粉刺好發區域，早晚各一次，避開眼周唇部。"
        SkinType = "青春痘、粉刺、發紅面皰及易出油泛紅肌膚。"
        Desc = "草本植萃調理配方，溫和淨化收斂痘痘，還原純淨平滑膚況。"
        Featured = $false
    },

    # 5. 日間防護系列
    @{
        Name = "水嫩飾底乳(膚色)"
        FileName = "水嫩飾底乳(膚色).html"
        Series = "日間防護系列"
        SeriesKey = "protect"
        Volume = "40 ml"
        Image = "images/水嫩飾底乳(膚色).jpg"
        Ingredients = @("超微米礦物柔焦粉體", "維他命E衍生物", "洋甘菊萃取", "透明質酸")
        Efficacy = "自然校正蠟黃暗沉膚色，修飾毛孔粗大與瑕疵，打造偽素顏裸妝好氣色。"
        Usage = "日間保養最後一步、上妝前使用，取適量均勻塗抹於全臉至頸部。"
        SkinType = "所有膚質，特別推薦膚色蠟黃、暗沉不均勻者。"
        Desc = "親膚水感質地，輕薄透氣不悶痘，一抹提亮立現水潤光澤。"
        Featured = $false
    },

    # 6. 面膜深層護理系列
    @{
        Name = "嫩白面膜"
        FileName = "嫩白面膜.html"
        Series = "面膜深層護理系列"
        SeriesKey = "mask"
        Volume = "5片/盒 (每片28ml)"
        Image = "images/嫩白面膜.jpg"
        Ingredients = @("傳明酸亮白因子", "九胜肽", "熊果素萃取", "日本頂級天絲膜布")
        Efficacy = "密集滲透淨白精華，改善暗沉與膚色不均，敷後肌膚立即水潤透亮、白皙有光澤。"
        Usage = "臉部清潔後，將面膜平整敷於全臉，靜待 15-20 分鐘後取下，按摩至剩餘精華完全吸收。"
        SkinType = "暗沉、蠟黃、急需提亮透白之全膚質。"
        Desc = "高濃度瞬效嫩白精華，深層導入肌底，實現沙龍級無瑕光感。"
        Featured = $true
    },
    @{
        Name = "蠶絲蛋白面膜"
        FileName = "蠶絲蛋白面膜.html"
        Series = "面膜深層護理系列"
        SeriesKey = "mask"
        Volume = "5片/盒 (每片30ml)"
        Image = "images/蠶絲蛋白面膜.jpg"
        Ingredients = @("高純度水解蠶絲蛋白", "海洋膠原胜肽", "神經醯胺", "透明質酸複合水")
        Efficacy = "深層修護受損肌膚屏障，撫平乾燥細紋，賦予肌膚彈潤豐盈，恢復絲綢般細膩觸感。"
        Usage = "潔顏後敷於臉部 15-20 分鐘，揭下面膜後將臉上精華液輕柔按摩至吸收無需沖洗。"
        SkinType = "乾燥缺水、敏感修護、換季敏弱與醫美術後修護。"
        Desc = "珍稀蠶絲蛋白小分子高滲透力，如隱形水膜般全方位滋潤。"
        Featured = $true
    }
)

Write-Host "Total active products configured: $($Products.Count)"

# -------------------------------------------------------------
# HTML Helper Functions
# -------------------------------------------------------------

function Get-NavbarHtml([string]$relPath = "") {
    return @"
  <header class="navbar-wrapper">
    <nav class="navbar">
      <a href="${relPath}index.html" class="nav-brand">
        <div class="brand-icon">
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
            <path d="M12 2.69l5.66 5.66a8 8 0 1 1-11.31 0z"></path>
          </svg>
        </div>
        <div class="brand-text-group">
          <span class="brand-title">萊渼國際</span>
          <span class="brand-subtitle">LAIMEI TRADE CO.</span>
        </div>
      </a>
      <ul class="nav-links">
        <li><a href="${relPath}index.html">首頁</a></li>
        <li><a href="${relPath}products.html">產品全系列</a></li>
        <li><a href="${relPath}index.html#series">草本美肌系列</a></li>
        <li><a href="${relPath}index.html#company">關於萊渼</a></li>
        <li><a href="${relPath}index.html#contact">聯絡我們</a></li>
      </ul>
      <div class="nav-cta">
        <a href="tel:0289535096" class="toll-free-badge">
          <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
          </svg>
          (02)8953-5096
        </a>
      </div>
    </nav>
  </header>
"@
}

function Get-FooterHtml([string]$relPath = "") {
    return @"
  <footer class="site-footer">
    <div class="container">
      <div class="footer-bottom-flex">
        <div class="footer-copy">
          <p>© 2026 <strong>萊渼國際貿易有限公司</strong> LAIMEI INTERNATIONAL TRADE CO., LTD. 版權所有</p>
          <p style="font-size:0.8rem; margin-top:0.25rem; color:#627d98;">北區總公司：新北市板橋區信義路117號5樓 ｜ 服務專線：(02)8953-5096 ｜ FAX: (02)8953-5119</p>
        </div>
        <ul class="footer-links">
          <li><a href="${relPath}index.html">首頁</a></li>
          <li><a href="${relPath}products.html">全部產品</a></li>
          <li><a href="${relPath}products/舒淨洗卸兩用.html">明星產品</a></li>
          <li><a href="${relPath}index.html#company">公司資訊</a></li>
        </ul>
      </div>
    </div>
  </footer>
"@
}

# -------------------------------------------------------------
# Generate index.html
# -------------------------------------------------------------
$indexHtml = @"
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>萊渼國際貿易有限公司 - 專業草本肌膚護理・水感極致美學</title>
  <meta name="description" content="萊渼國際貿易有限公司官方網站。專業草本植萃保養品，提供清潔、調理、重點精華、滋潤修護、日間防護與面膜深層護理全方位沙龍級呵護。">
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <canvas id="liquid-canvas"></canvas>
  <div class="ambient-glow"></div>

  $(Get-NavbarHtml "")

  <!-- HERO SECTION -->
  <section class="hero-section">
    <div class="container">
      <div class="hero-grid">
        <div class="hero-content">
          <div class="badge-tag">
            <span class="dot"></span>
            <span>Lenor Herbal 萊渼生化草本美肌</span>
          </div>
          <h1 class="hero-title">
            源自深海與植萃<br>
            <span class="gradient-text">凝潤純淨水感保養</span>
          </h1>
          <p class="hero-desc">
            萊渼國際貿易有限公司專注於溫和、高效的草本美肌配方，融合天然角鯊烯、氨基酸潔膚與深海活泉能量，為各類型敏弱與嬌嫩肌膚打造專屬水感修護屏障。
          </p>
          <div class="hero-actions">
            <a href="products.html" class="btn-liquid">
              <span>探索全系列產品</span>
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                <line x1="5" y1="12" x2="19" y2="12"></line>
                <polyline points="12 5 19 12 12 19"></polyline>
              </svg>
            </a>
            <a href="#company" class="btn-liquid-outline">
              <span>關於萊渼公司</span>
            </a>
          </div>
          <div class="hero-stats">
            <div class="stat-item">
              <h4>6 大</h4>
              <p>專業草本修護系列</p>
            </div>
            <div class="stat-item">
              <h4>$($Products.Count) 款</h4>
              <p>沙龍專利級護膚品</p>
            </div>
            <div class="stat-item">
              <h4>專人服務</h4>
              <p>專業美肌諮詢專線</p>
            </div>
          </div>
        </div>

        <div class="hero-visual">
          <div class="liquid-glass liquid-showcase-pedestal">
            <div class="liquid-orb-bg"></div>
            <div class="hero-product-img-wrapper">
              <img src="images/舒淨洗卸兩用.jpg" alt="舒淨洗卸兩用" class="hero-product-img">
            </div>
            <div class="hero-product-meta">
              <span class="tag">經典熱銷推薦 ✦ 沙龍級純淨植萃</span>
              <h3>舒淨洗卸兩用</h3>
              <p>氨基酸洗顏・天然角鯊烯・洋甘菊萃取 ｜ 200 ml</p>
              <div style="margin-top:1.25rem;">
                <a href="products/舒淨洗卸兩用.html" class="btn-liquid" style="font-size:0.88rem; padding:0.6rem 1.4rem;">
                  查看產品詳細資訊 →
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- PRODUCTS SHOWCASE & TABS -->
  <section class="products-section" id="series" style="padding: 4rem 0;">
    <div class="container">
      <div class="section-header">
        <span class="sub-badge">PROFESSIONAL SERIES</span>
        <h2>精選草本美肌系列產品</h2>
        <p>每一款產品皆採用頂級配方與實拍商攝展示，點選即可查看獨立產品規格、成分與功效介紹</p>
      </div>

      <div class="filter-tabs-wrapper">
        <div class="filter-tabs">
          <button class="tab-btn active" data-category="all">全部系列 ($($Products.Count))</button>
          <button class="tab-btn" data-category="cleanse">清潔系列</button>
          <button class="tab-btn" data-category="condition">調理系列</button>
          <button class="tab-btn" data-category="serum">重點精華保養</button>
          <button class="tab-btn" data-category="repair">日夜滋潤修護</button>
          <button class="tab-btn" data-category="protect">日間防護</button>
          <button class="tab-btn" data-category="mask">面膜深層護理</button>
        </div>
      </div>

      <div class="products-grid">
"@

foreach ($p in $Products) {
    $ingBadges = ""
    foreach ($ing in $p.Ingredients) {
        $ingBadges += "<span class='ingredient-badge'>$ing</span>`n"
    }
    
    $indexHtml += @"
        <!-- Card: $($p.Name) -->
        <a href="products/$($p.FileName)" class="liquid-glass product-card" data-category="$($p.SeriesKey)">
          <div class="product-thumb-box">
            <span class="product-series-tag">$($p.Series)</span>
            <span class="product-spec-pill">$($p.Volume)</span>
            <img src="$($p.Image)" alt="$($p.Name)" class="product-thumb-img">
          </div>
          <div class="product-body">
            <h3 class="product-name">$($p.Name)</h3>
            <p class="product-desc-snippet">$($p.Efficacy)</p>
            <div class="product-ingredients-snippet">
              $ingBadges
            </div>
            <div class="product-footer-action">
              <span class="view-detail-link">
                查看產品規格
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <polyline points="9 18 15 12 9 6"></polyline>
                </svg>
              </span>
            </div>
          </div>
        </a>
"@
}

$indexHtml += @"
      </div>
    </div>
  </section>

  <!-- COMPANY INFO SECTION -->
  <section class="company-info-section" id="company">
    <div class="container">
      <div class="section-header">
        <span class="sub-badge">ABOUT COMPANY</span>
        <h2>公司資訊與專業服務</h2>
        <p>深耕台灣專業美容沙龍通路，為消費者提供安全、純淨、有感的高品質保養品</p>
      </div>

      <div class="company-card-grid">
        <div class="liquid-glass company-details-card">
          <div class="company-title-wrap">
            <span class="badge-tag" style="margin-bottom:0.5rem;"><span class="dot"></span> 總公司資訊</span>
            <h3>$($Company.Name)</h3>
            <span class="en-name">$($Company.NameEn)</span>
          </div>

          <div class="company-info-list">
            <div class="info-row">
              <div class="info-icon-badge">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                  <circle cx="12" cy="10" r="3"></circle>
                </svg>
              </div>
              <div class="info-content">
                <div class="label">北區總公司地址</div>
                <div class="val">$($Company.Address)</div>
              </div>
            </div>

            <div class="info-row">
              <div class="info-icon-badge">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
                </svg>
              </div>
              <div class="info-content">
                <div class="label">服務諮詢專線</div>
                <div class="val"><a href="tel:0289535096" class="service-highlight-number">$($Company.Tel)</a></div>
              </div>
            </div>

            <div class="info-row">
              <div class="info-icon-badge">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                  <polyline points="22,6 12,13 2,6"></polyline>
                </svg>
              </div>
              <div class="info-content">
                <div class="label">傳真電話</div>
                <div class="val">
                  FAX: $($Company.Fax)
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="liquid-glass company-aside-card" id="contact">
          <div class="aside-block">
            <h4>客戶服務與諮詢保證</h4>
            <p>萊渼國際擁有多年專業沙龍與護膚品代理經驗，提供完整的產品配方諮詢、沙龍店家合作與個人化肌膚護理建議。</p>
            <p style="color:#0284c7; font-weight:700;">服務時間：$($Company.Hours)</p>
          </div>

          <div style="margin-top:1.5rem;">
            <a href="tel:0289535096" class="phone-action-btn" style="width:100%; justify-content:center;">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
              </svg>
              立即撥打客服專線 (02)8953-5096
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>

  $(Get-FooterHtml "")

  <script src="js/products-data.js"></script>
  <script src="js/liquid.js"></script>
</body>
</html>
"@

[System.IO.File]::WriteAllText("c:\Users\user\Desktop\lenorherbal\index.html", $indexHtml, [System.Text.Encoding]::UTF8)
Write-Host "Generated index.html successfully."

# -------------------------------------------------------------
# Generate products.html (Catalog Directory)
# -------------------------------------------------------------
$catalogHtml = @"
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>產品全系列目錄 - 萊渼國際貿易有限公司</title>
  <meta name="description" content="瀏覽萊渼國際貿易有限公司全部草本美肌產品：清潔系列、調理系列、重點精華保養、日夜滋潤修護、日間防護、面膜護理系列。">
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <canvas id="liquid-canvas"></canvas>
  <div class="ambient-glow"></div>

  $(Get-NavbarHtml "")

  <div class="container" style="padding-top: 2rem; padding-bottom: 5rem;">
    <div class="breadcrumb-nav">
      <a href="index.html">首頁</a>
      <span class="sep">/</span>
      <span class="current">產品全系列</span>
    </div>

    <div class="section-header">
      <span class="sub-badge">PRODUCT CATALOG</span>
      <h2>萊渼全系列產品總覽</h2>
      <p>點選任一產品即可進入獨立產品頁面，查看詳細配方、功效與使用說明</p>
    </div>

    <div class="filter-tabs-wrapper">
      <div class="filter-tabs">
        <button class="tab-btn active" data-category="all">全部系列 ($($Products.Count))</button>
        <button class="tab-btn" data-category="cleanse">清潔系列</button>
        <button class="tab-btn" data-category="condition">調理系列</button>
        <button class="tab-btn" data-category="serum">重點精華保養</button>
        <button class="tab-btn" data-category="repair">日夜滋潤修護</button>
        <button class="tab-btn" data-category="protect">日間防護</button>
        <button class="tab-btn" data-category="mask">面膜深層護理</button>
      </div>
    </div>

    <div class="products-grid">
"@

foreach ($p in $Products) {
    $ingBadges = ""
    foreach ($ing in $p.Ingredients) {
        $ingBadges += "<span class='ingredient-badge'>$ing</span>`n"
    }

    $catalogHtml += @"
      <!-- Card: $($p.Name) -->
      <a href="products/$($p.FileName)" class="liquid-glass product-card" data-category="$($p.SeriesKey)">
        <div class="product-thumb-box">
          <span class="product-series-tag">$($p.Series)</span>
          <span class="product-spec-pill">$($p.Volume)</span>
          <img src="$($p.Image)" alt="$($p.Name)" class="product-thumb-img">
        </div>
        <div class="product-body">
          <h3 class="product-name">$($p.Name)</h3>
          <p class="product-desc-snippet">$($p.Efficacy)</p>
          <div class="product-ingredients-snippet">
            $ingBadges
          </div>
          <div class="product-footer-action">
            <span class="view-detail-link">
              查看規格與成分
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <polyline points="9 18 15 12 9 6"></polyline>
              </svg>
            </span>
          </div>
        </div>
      </a>
"@
}

$catalogHtml += @"
    </div>
  </div>

  $(Get-FooterHtml "")

  <script src="js/products-data.js"></script>
  <script src="js/liquid.js"></script>
</body>
</html>
"@

[System.IO.File]::WriteAllText("c:\Users\user\Desktop\lenorherbal\products.html", $catalogHtml, [System.Text.Encoding]::UTF8)
Write-Host "Generated products.html successfully."

# -------------------------------------------------------------
# Generate Individual Chinese Product Pages inside /products/
# -------------------------------------------------------------
foreach ($p in $Products) {
    $ingChips = ""
    foreach ($ing in $p.Ingredients) {
        $ingChips += "<span class='ingredient-chip'>【$ing】</span>`n"
    }

    $sameSeriesProducts = $Products | Where-Object { $_.SeriesKey -eq $p.SeriesKey }
    $seriesNavItems = ""
    foreach ($sp in $sameSeriesProducts) {
        $activeClass = if ($sp.Name -eq $p.Name) { "style='color:#0284c7; font-weight:700; background:rgba(2,132,199,0.08); border-radius:8px; padding:0.4rem 0.8rem; display:block; border-left:3px solid #0284c7;'" } else { "style='color:#486581; text-decoration:none; display:block; padding:0.4rem 0.8rem; transition:color 0.2s;'" }
        $seriesNavItems += "<li><a href='$($sp.FileName)' $activeClass>$($sp.Name)</a></li>`n"
    }

    $productDetailHtml = @"
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>$($p.Name) - $($p.Series) | 萊渼國際貿易有限公司</title>
  <meta name="description" content="$($p.Name) - $($p.Series)。主成份：$($p.Ingredients -join '、')。$($p.Efficacy)">
  <link rel="stylesheet" href="../css/style.css">
</head>
<body>
  <canvas id="liquid-canvas"></canvas>
  <div class="ambient-glow"></div>

  $(Get-NavbarHtml "../")

  <main class="product-detail-section">
    <div class="container">
      <!-- Breadcrumb -->
      <nav class="breadcrumb-nav">
        <a href="../index.html">首頁</a>
        <span class="sep">/</span>
        <a href="../products.html">產品系列</a>
        <span class="sep">/</span>
        <a href="../products.html#$($p.SeriesKey)">$($p.Series)</a>
        <span class="sep">/</span>
        <span class="current">$($p.Name)</span>
      </nav>

      <!-- Main Layout -->
      <div class="detail-layout-grid">
        <!-- Left: Product Media Pedestal & Series Quick Nav -->
        <div style="display:flex; flex-direction:column; gap:2rem;">
          <div class="liquid-glass detail-media-card">
            <div class="detail-bottle-wrapper">
              <div class="detail-bottle-glow"></div>
              <img src="../$($p.Image)" alt="$($p.Name)" class="detail-bottle-img">
            </div>
            <div class="detail-media-badges">
              <span class="media-badge-pill">$($p.Series)</span>
              <span class="media-badge-pill">容量 $($p.Volume)</span>
            </div>
          </div>

          <!-- Series Nav (Matching the original catalog menu from image!) -->
          <div class="liquid-glass" style="padding:1.5rem;">
            <h4 style="font-size:1.05rem; margin-bottom:1rem; color:#0c4a6e; display:flex; align-items:center; gap:0.5rem;">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M4 6h16M4 12h16M4 18h16"/></svg>
              $($p.Series) 同系列清單
            </h4>
            <ul style="list-style:none; display:flex; flex-direction:column; gap:0.35rem;">
              $seriesNavItems
            </ul>
          </div>
        </div>

        <!-- Right: Information & Specifications -->
        <div class="detail-info-panel">
          <div class="product-header-block">
            <span class="category-lead">$($p.Series) ｜ 專利草本配方</span>
            <h1 class="gradient-text">$($p.Name)</h1>
            <div class="product-meta-row">
              <div class="meta-item">
                <span>容量規格：</span>
                <strong>$($p.Volume)</strong>
              </div>
            </div>
          </div>

          <!-- Specs Cards -->
          <div class="spec-box-group">
            <!-- Active Ingredients -->
            <div class="spec-box">
              <h3>
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M12 2v20M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
                </svg>
                主成份
              </h3>
              <div class="ingredients-flow">
                $ingChips
              </div>
            </div>

            <!-- Efficacy -->
            <div class="spec-box">
              <h3>
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                  <polyline points="22 4 12 14.01 9 11.01"></polyline>
                </svg>
                功效
              </h3>
              <p>$($p.Efficacy)</p>
            </div>

            <!-- Usage -->
            <div class="spec-box">
              <h3>
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <circle cx="12" cy="12" r="10"></circle>
                  <polyline points="12 6 12 12 16 14"></polyline>
                </svg>
                使用方法
              </h3>
              <p>$($p.Usage)</p>
            </div>

            <!-- Skin Type Recommendation -->
            <div class="spec-box">
              <h3>
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
                </svg>
                適用肌膚
              </h3>
              <p><strong>$($p.SkinType)</strong></p>
            </div>
          </div>

          <!-- Customer Service Inquiry Box -->
          <div class="inquiry-cta-box">
            <div class="inquiry-text">
              <h4>諮詢此項產品或訂購？</h4>
              <p>歡迎致電萊渼總公司服務專線，由專業護膚顧問為您服務。</p>
            </div>
            <a href="tel:0289535096" class="phone-action-btn">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
              </svg>
              (02)8953-5096
            </a>
          </div>
        </div>
      </div>
    </div>
  </main>

  $(Get-FooterHtml "../")

  <script src="../js/products-data.js"></script>
  <script src="../js/liquid.js"></script>
</body>
</html>
"@

    $chinesePath = "c:\Users\user\Desktop\lenorherbal\products\$($p.FileName)"
    [System.IO.File]::WriteAllText($chinesePath, $productDetailHtml, [System.Text.Encoding]::UTF8)
}

Write-Host "Regenerated all active Chinese product pages with updated phone (02)8953-5096."
