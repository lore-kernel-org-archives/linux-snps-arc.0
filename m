Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE387C433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Feb 2022 15:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RusJWbA9jQNR3Q+yYNFIsBNUoTcimZ6qsbovZfWixRg=; b=SmaiOi2dnsJvtZ
	BZ5RtEXjm/1YYoG+EI2+jb4sgWQ+Wiv0uqcd3U7iIgrXiIrFG+1CVpULX1vcfxAT5nUOsZQOY/9W7
	WxCd3/qFmEJ015qVbWNaehgZmZEc8sM5QiwjwWCxsAePDtupRmB5B4VwKTmjhelhL1IEmypWfi8x0
	KykhU98oGy31aJXK6QNqrnCG+pi4YVwyqV5uG1r08xw2MC1U31d16D23O1tA7VtK8BqFF+wYEgErQ
	9QGRzlsL2c0+fdx4d6yveCGnrRVn/2vEeZE8oN3WuCClE3pwG1ZQUHIJtYX68AtK+YtNocwrwUsT5
	Bp/zRW6AEOtx4Ng+HLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEv2O-00Cf4b-GG; Tue, 01 Feb 2022 15:25:44 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEulL-00CWm9-Bu
 for linux-snps-arc@lists.infradead.org; Tue, 01 Feb 2022 15:08:08 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 94BEF67373; Tue,  1 Feb 2022 16:08:00 +0100 (CET)
Date: Tue, 1 Feb 2022 16:08:00 +0100
From: Christoph Hellwig <hch@lst.de>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-snps-arc@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>,
 Vladimir Isaev <isaev@synopsys.com>, Christoph Hellwig <hch@lst.de>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: Re: [RFC PATCH 1/3] arc: use BUILD_BUG for invalid sizes in
 get_user/put_user
Message-ID: <20220201150800.GA3731@lst.de>
References: <20220201145538.111192-1-geomatsi@gmail.com>
 <20220201145538.111192-2-geomatsi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220201145538.111192-2-geomatsi@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_070807_596381_9A992361 
X-CRM114-Status: GOOD (  10.41  )
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

On Tue, Feb 01, 2022 at 05:55:36PM +0300, Sergey Matyukevich wrote:
> From: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
> 
> Use BUILD_BUG for compile-time check of invalid sizes passed
> to get_user/put_user functions.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
