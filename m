Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12BBC433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Feb 2022 15:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCUtSd5lKvuIks48sxwzL4nkAnkL8QbndhQ1agJEJWY=; b=l3AIieEfp0BoHj
	9hICfuDZVSzVWTD8YhUij/kgsGT0Dyva8nLE1rpScUUM5oQsJ1faLJtnrWd0SqUZKxlCZsWt1kzC+
	c0LurkcYCDdax1DMBiTMluQqHqMQKruRocMn/hN0j0npF9yjOYJxJWpFwz3uw/mqSse3SQuPzUQC2
	tZuzVftqyC0SPB3nEfELnDkU20qMujDuo5GmAzjQHvU6HuIGvyTHjstc/pG9evYAC4+GTbJJ0KCwX
	hX5GsGl8Gtq17pND1su7DtwfoccssRkj3TlI7Brv3ARpGQhpqSfa0ZR0GhElmSw5dMBLUvCFRzOiZ
	CB9GOiY6+snRIRwWY2OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEv2Q-00Cf5Y-2j; Tue, 01 Feb 2022 15:25:46 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEup7-00CYvU-8z
 for linux-snps-arc@lists.infradead.org; Tue, 01 Feb 2022 15:12:02 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7B95967373; Tue,  1 Feb 2022 16:11:58 +0100 (CET)
Date: Tue, 1 Feb 2022 16:11:58 +0100
From: Christoph Hellwig <hch@lst.de>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-snps-arc@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>,
 Vladimir Isaev <isaev@synopsys.com>, Christoph Hellwig <hch@lst.de>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: Re: [RFC PATCH 3/3] arc: remove set_fs()
Message-ID: <20220201151158.GC3731@lst.de>
References: <20220201145538.111192-1-geomatsi@gmail.com>
 <20220201145538.111192-4-geomatsi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220201145538.111192-4-geomatsi@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_071201_519508_4C069C16 
X-CRM114-Status: UNSURE (   8.17  )
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

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
