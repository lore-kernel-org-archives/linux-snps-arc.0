Return-Path: <SRS0=AMLI=7E=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEEEC433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 22 May 2020 16:37:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB6C920679
	for <linux-snps-arc@archiver.kernel.org>; Fri, 22 May 2020 16:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bMNNCA1m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB6C920679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lwEFzfk7Vz1TLzcw6asizK7+fQvA5A8QN6CkzjhUO+A=; b=bMNNCA1mLk1t7k
	ZUzEEF11ZcBmGWUrTYwRIyL30fjn7Hgm5ZYvrR+W4gXSzlbt6MiTvjX88sCSC7Pjz3FlxJecWgpAG
	2q63+K6hm5dIYIppoLr4Dp7/YH41357tgB42adm+GNVHoXOqWo1j98e0vDvPAd3LEvUBTDBzTWmic
	IQsuWSOcT7EoPQ6dQKLfSwkKSYA098hqgZJv7kJNQBIvWBdCelklcAmz/iGL61QwIttizfFG0Wgvj
	BYI3BQIB9j5WmXrNv2DNZl5OlYz2ApvzcJiWWTgvhQab4THME0f3WAaXX/WZ97Vnep831DWEtXc+9
	Tn9N6cqY+cod6IIFedJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcAgF-0004o6-Uw; Fri, 22 May 2020 16:37:55 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcAgD-0004n5-HE
 for linux-snps-arc@lists.infradead.org; Fri, 22 May 2020 16:37:54 +0000
IronPort-SDR: nbt2WhAhMOgwCqUGCU9BeFT6sHxRMAaPFkhU7OzRfUKZBPz0MjMXbCgtIeyR6mwRxBugKTsKQo
 PTqJ0O+mo0TQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2020 09:37:47 -0700
IronPort-SDR: v05CruEDS/sQbJcCpXJ4yZigvNIF5MkdrMEIhvH0Vnxdhv3UvesWPTo5bJH61nOfyMZ3RcOolH
 wA9fTpvH3d3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,422,1583222400"; d="scan'208";a="254318997"
Received: from omillerx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.43.59])
 by fmsmga007.fm.intel.com with ESMTP; 22 May 2020 09:37:45 -0700
Date: Fri, 22 May 2020 19:37:45 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
Subject: Re: [PATCH v3] Kernel selftests: Add check if TPM devices are
 supported
Message-ID: <20200522163745.GB10319@linux.intel.com>
References: <20200521144344.1886-1-Nikita.Sobolev@synopsys.com>
 <20200522163714.GA10319@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522163714.GA10319@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_093753_611304_0A6AE7A6 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-kselftest@vger.kernel.org, Tadeusz Struk <tadeusz.struk@intel.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Joey Pabalinas <joeypabalinas@gmail.com>,
 Petr Vorel <petr.vorel@gmail.com>, linux-integrity@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, Shuah Khan <shuah@kernel.org>,
 Peter Huewe <peterhuewe@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, May 22, 2020 at 07:37:17PM +0300, Jarkko Sakkinen wrote:
> On Thu, May 21, 2020 at 05:43:44PM +0300, Nikita Sobolev wrote:
> > TPM2 tests set uses /dev/tpm0 and /dev/tpmrm0 without check if they
> > are available. In case, when these devices are not available test
> > fails, but expected behaviour is skipped test.
> > 
> > Signed-off-by: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
> 
> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

Shuah, can you pick this up?

/Jarkko

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
