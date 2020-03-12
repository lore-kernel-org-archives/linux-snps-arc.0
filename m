Return-Path: <SRS0=RZv2=45=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B21C10DCE
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Mar 2020 21:46:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0348D20674
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Mar 2020 21:46:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AIq+N6N6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0348D20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pID7Npa/UO7nBmGEWR3s2BXwcI3HY5gfWJwlmECuts0=; b=AIq+N6N6r9lkie
	j2w2nWoJD+UEP0VGtmZok/x3KwUTRq622C8hBxYs1Bst5cvKne6rUAdk7AAjcajfaVCuwQ7fHjSo6
	X/lklHgAiudm48zgtm21obIcgX/y3mRjw/WigO79DlpVQ8bQHg16AsF75INCGZY6tNK6fGN6f9hUF
	luIg9xkGfPo4UhqhJywy75kCfyp282xoRP1xH9BcIbV5+lcgR2a3+SpQFWMJVRX9hZ2Lj7oqb9+ww
	nEBguCfEKnOmnFLasHjEhUKXxzMNZj5L9XSt0bRzal0RfBUM1PmfMXUwKmM8gsX1ZHhL1Flenbyet
	NrQihwSeaD6IG17ZJEQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCVf1-00053m-0v; Thu, 12 Mar 2020 21:46:35 +0000
Received: from esa4.mentor.iphmx.com ([68.232.137.252])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCVey-00053B-9Z
 for linux-snps-arc@lists.infradead.org; Thu, 12 Mar 2020 21:46:33 +0000
IronPort-SDR: PCVp+KeTZ+6RHybvlIugRRY1X5ngcE4++/RP2j6b/wSF59268cPli2PSe0zg29KIfst8E/zWdi
 Gab7LZ2Z20EpOquFvW9cI5Ry/Tb/7ujUOM3NQ8ttpCR/KDAkx8YEzE9T3qwcnkaCJjAYCfa3na
 FYSzVSaDxPhqtDOicNlvS8e25UhisB8URBAXZkiMmkXPYmxhTl0AlElOMQSrppjhDXTzpMBBYT
 zrHp28v4W0QruBsUdfkoUaevSI1e6cJ4aa/l0VhE9sEdId7XB3O+UhS+mWtDfzFTUKyqDZ9DsW
 i3U=
X-IronPort-AV: E=Sophos;i="5.70,546,1574150400"; d="scan'208";a="46717204"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa4.mentor.iphmx.com with ESMTP; 12 Mar 2020 13:46:31 -0800
IronPort-SDR: /AhPIA4GJJ1OpsSsSyEwKQi7yaAsSUNQQsqF9tEpmYTxHwHsJ3ULg+TetL/009Mbhg0xtju3w2
 MyHMuq/Qq0EMXSuByBnm6Xx+FX3ojVpR4OmLBVUs5mEd+7x+JcniFjvQYa91qnn2ZmFJBOHzuY
 7hAXt5HOu/qzv39aWfvhrNSN+U6ibCsA1HP6g8NYz8r9D6D9gWjSvOmA5Hiv/3I9fD/x4D8qtK
 q6BAL4KnhZ+gTDCQNMC8m9ytVOk6p/KWjP19tVRFAmG/53garjvAUi2358J+IA00VR7ngu9xdj
 2ZU=
Date: Thu, 12 Mar 2020 21:46:26 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v3 00/17] glibc port to ARC processors
In-Reply-To: <7ac0aa7f-9c1c-d889-a087-2608932091b2@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003122145000.1240@digraph.polyomino.org.uk>
References: <20200306182419.13945-1-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003070020370.26274@digraph.polyomino.org.uk>
 <cc9d1b80-1568-f658-ce65-fdacad669956@synopsys.com>
 <alpine.DEB.2.21.2003070108590.26274@digraph.polyomino.org.uk>
 <7ac0aa7f-9c1c-d889-a087-2608932091b2@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_144632_364079_D07D2D28 
X-CRM114-Status: UNSURE (   9.20  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, 12 Mar 2020, Vineet Gupta wrote:

> Hi Joseph,
> 
> On 3/6/20 5:10 PM, Joseph Myers wrote:
> > On Sat, 7 Mar 2020, Vineet Gupta wrote:
> > 
> >> On 3/6/20 4:21 PM, Joseph Myers wrote:
> >>> Please give details of what the entries would be for 
> >>> <https://sourceware.org/glibc/wiki/ABIList> and 
> >> ARC
> >>    * 32-bit, hard-float, LE: /lib/ld-linux-arc.so.2
> >>    * 32-bit, soft-float, LE: /lib/ld-linux-arc.so.2
> >>
> >> (soft-float ABI is compatible with hardware-float builds in terms of calling
> >> convention, register-file etc)
> > So that should actually be one bullet-point entry for soft-float ABI, 
> > rather than two entries, because it's a single ABI, with a clarifying note 
> > following like those for some other architectures.
> 
> Are you waiting for me to fold the 64-bit time stuff and a respin for a 
> more in depth review of the patchset. I appreciate you have a zillion 
> other things backed up on your todo list :-)

The patch series definitely needs revision for the issues I mentioned, 
yes.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
