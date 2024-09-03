Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85726CD3420
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Sep 2024 09:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=chvvvXpM1/rxahcaflw+ry8X2dF6cGAaCsJoJHJYgwo=; b=SEvNV2U3vYOoV/
	jj3zp2+rbqwDgSIt+sl13qvvbcTcMoj2GpfyfBfcKHYFMMBlciyl41Ok1TBpYMjtAUR/yZ6+evtM1
	T4pkHin5D4sIoQoclHDcBPk/UAgpUE30gquhaaPHaOLqOYQQ3eP5JtOnKstmlHJB8NwnCDxYPO4jw
	toHwsBsmuJJeggt/JqQtnKd+ta5al1g21YX2UN8c3zV4m5aLPq/bzER9xdZDCURvzmwnGhzXwLEih
	zcCXAMhJz/p8M+3fS2DNdGonvoC6TXG7cLv/yhX28q9jYVtA5AD+UEUOjXq+yuC9jfGGufJBlgGhd
	DrXN/WuRSl67XPGKwxDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slPkX-0000000H7aS-11ya;
	Tue, 03 Sep 2024 09:22:57 +0000
Received: from mod.modforum.org ([192.254.136.77])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slPjP-0000000H7C5-2dis
	for linux-snps-arc@lists.infradead.org;
	Tue, 03 Sep 2024 09:21:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=basantfashion.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=G4BItOc8k/hB4suOfWWwTOg/U0FTlHwyCNnKCLPge2w=; b=YNyD2LvoN9Oaik2QQo5iD39dbl
	kdkM2o3ItKG+I2NyXajYMFXNNfGbqNmBf3LfXymypmZ2siLpAor4j1bmOOfacIAbRAY4SoyFsw80z
	9cAiomfa+lwMqjzIzAiKmMUTbsKjyJrMh3MUTg0pGdK5D3XzZM2ZARka/Uyuv2QT/SoRIMnQzvlkq
	Cmgc3LQv29ShAlS1hudzfaKJCyNbpYdC28ZhpSq/XHVjEUkPEReRjA1MKRDJa1EDDNraqXAe+naXj
	kH5Z+Ld07UoEL2AMhNSn9tTMtIZsC8HacXMRIoJORtc+ppPBu91UyWvHskRq146W3wJRQkOsCwELT
	jstci4/Q==;
Received: from [162.244.210.121] (port=64857)
	by mod.modforum.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <kuljeet@basantfashion.com>)
	id 1slPiT-0002XO-IY
	for linux-snps-arc@lists.infradead.org; Tue, 03 Sep 2024 04:20:49 -0500
From: MERCURIA  <kuljeet@basantfashion.com>
To: linux-snps-arc@lists.infradead.org
Subject: Request for Quote and Meeting Availability
Date: 3 Sep 2024 02:21:44 -0700
Message-ID: <20240903022144.674F07002F6D7149@basantfashion.com>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - mod.modforum.org
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - basantfashion.com
X-Get-Message-Sender-Via: mod.modforum.org: authenticated_id: kuljeet@basantfashion.com
X-Authenticated-Sender: mod.modforum.org: kuljeet@basantfashion.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_022147_759226_3548FC99 
X-CRM114-Status: UNSURE (  -2.04  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Reply-To: procurement@mercuira.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Greetings,

I hope you are doing great.

We have reviewed your products on your website, and several items 
have caught our interest. We would like to request a quote the 
following

Can you ship to the United States?

What are your best prices?

What support do you provide?

We are also interested in your services for this project.

Could you let us know your availability for a virtual meeting on 
Zoom to discuss this project further?

Please advise us on these matters so that we can prepare a 
meeting notice for our company executives to effectively engage 
with you.

Thank you for your attention to this inquiry. We look forward to 
your prompt response.

Best regards,

Nina Petrova
Procurement Manager
Email: procurement@mercuira.com
12 Marina View, Asia Square Tower 2, #26-01, Singapore, 018961
Phone: +65 641 1080

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
