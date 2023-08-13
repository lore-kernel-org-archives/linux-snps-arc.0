Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DB9C001DB
	for <linux-snps-arc@archiver.kernel.org>; Sun, 13 Aug 2023 19:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eIfIoHs9dIy5ERtvykJ0WFldWvcsAWa9g8qqWbFhPcQ=; b=bg0zCh1AW5ghCE
	d7IL1AgB95z0UoCfDJyb0YSxHC58tb14qls883iGshYIRzvEdSjwnACEzz4f5OBOeJKeOPM/hJEaz
	jIn87ET0ZbuEAe4RxKpxHsr8bojj8VxeaRp4bvZ643C0ioFh0KnxrcvpUVyIGSrd8OP4dm19u/W5o
	7z86D6TaKUSB6gdMqOtqRDI3iruGy0XX2r0lSXNV0V3IvbzfpEsNekphp14lXUyAHff8eaxjyKW11
	3oPhsEf2nAVB/G+QDJj0fNbMPwsUEaK9oIhMcszAm2qm9kWBXnUPOLrGHIzNd4RsezTAEDGvPtE5e
	hQIV6f9E2eI/I4XLPUnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGcD-00FcAf-2D;
	Sun, 13 Aug 2023 19:19:05 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGcA-00Fc9l-0E
	for linux-snps-arc@lists.infradead.org;
	Sun, 13 Aug 2023 19:19:04 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id E55D13200368;
	Sun, 13 Aug 2023 15:18:55 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sun, 13 Aug 2023 15:18:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1691954335; x=1692040735; bh=lG
	5E+ZSscgZWtlQTdln7AyBIj97F64+JM6wMMoPAZtM=; b=bPQFjm/HdDocr9MCPV
	rBg3XNDI2BtEruxH8eJnD6lUECoVSfsP0O56QHNIxYTBH08xDHrzn+A/5aJw+s9W
	YwOavd1Sc0M+fazSWCjQFs1qkkz/PwsdCZ9KPJtZQKX+/nWh98X0W8hXL/PeZB2K
	5FKgt9aZDqNfvFVvrgkZMEWLdM1AmD6FqeWo1xRq+SBIEIJKNp7gpoY+aksXElue
	bJrhGvUVsHo0jZ1rQbCLo33oJhUwGhrjShRan/NE/iXyw1UxaAKecaYVbLuDAZyD
	vE52JMCpHL+JaghADbhSBXhNmMRxJNJPXUPdLQmPXcF76PSaEY3Emc20EocICWnd
	TZGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1691954335; x=1692040735; bh=lG5E+ZSscgZWt
	lQTdln7AyBIj97F64+JM6wMMoPAZtM=; b=bomY0eAyuUdg6Ze4IqN3rgMPyh5Vy
	4POGWzA9yLq3XFNuf9byTBFuCbgnv+NqTVTxBFDH/n5a8r9nMkr2x9jC5USfO3fB
	xHFt7zbacurwjwc1JaJ77ABmKvwLUpiRY0QcsFeUxy7bReXh8dw+vyJSQ73f+O+x
	/pWF0pmRt43X/fYl3vZS8oXyQpKYDPJyKZzlQKPEb+p/xwOAQ7RP6wlWkeCskxhk
	CqW0uoKsXuhfLlbRxoMJZibfXvKCaKIFA623sXNC9blXDG0Ak299pEEQuf0W8BSn
	QLnz1RBC5uU006GUvRFEgFmU1r1CS+fymz2Eo5ewMiIlveXNGzoLANpTQ==
X-ME-Sender: <xms:nyzZZJDrdoD0uQ_CqMnDoX35CyrBTWRw7OvVpcyjO50zgzADwDtAGA>
    <xme:nyzZZHjI-9reaQ0XP8vsPVlSuMMo3SiA-9DcrAWQjh_u8trBTxsCQI7x_8dNCAhPv
    w10aSR5VhSEG2LzAH8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtvddgudeffecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:nyzZZEmDUEm4nWpSz719oT2W9llYdVQ7eTZiNg1OPX1q9wSLxmPLFw>
    <xmx:nyzZZDzoaieaVPaxEeIkcdAwLJRWkTb8C37oyA8NJAofklzlBIInsw>
    <xmx:nyzZZOSNvjBzlfLib2AMHUaYuKfP95F7T-lD068OY2rEm0UP7qIyQQ>
    <xmx:nyzZZH5gxe2si0trLzMdq_z6mtHscN8dGnCEo0mdOV_KoEoTygI4uw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 16AECB60089; Sun, 13 Aug 2023 15:18:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <961b0945-f783-4a0e-a108-4549ec702d22@app.fastmail.com>
In-Reply-To: <20230813191655.474577-1-vgupta@kernel.org>
References: <20230813191655.474577-1-vgupta@kernel.org>
Date: Sun, 13 Aug 2023 21:18:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vineet Gupta" <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARC: -Wmissing-prototype warning fixes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_121902_502032_33E23A26 
X-CRM114-Status: UNSURE (   6.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sun, Aug 13, 2023, at 21:16, Vineet Gupta wrote:
> Anrd reported [1] new compiler warnings due to -Wmissing-protype.
> These are for non static functions mostly used in asm code hence not
> exported already. Fix this by adding the prototypes.
>
> [1] https://lore.kernel.org/lkml/20230810141947.1236730-1-arnd@kernel.org
>
> Signed-off-by: Vineet Gupta <vgupta@kernel.org>

Looks good to me,

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
