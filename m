Return-Path: <SRS0=jMyS=7P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037D0C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 17:48:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F1BB206E2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 17:48:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ae1JCyVa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F1BB206E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3uyyVif0czWsu6oZt7+ZyBXXkHJCvJO12ACoH2IdNr4=; b=Ae1JCyVaVDOQcD
	RSj6iyUbzLcbkdZ++0HdoJCjMsQhg2RLSlxIimTr2PYWrGtiyfzpD2D4TzAgnGbrOkIGGBefwYMuZ
	oiK6g9NbALQTL6w2sljmPVvxIyW7h3fCKrDaUB8QugTimIMwKuLOIo8OzqKTPi+PhBoVzIq7PnZjr
	FAgPKxF+rdMKVd1fYnz4S02dJ8c+GPhwYFvuMfCPjgdp5BOTFKsXXzZ1/PwbcfsobpP5Fj9oldZkq
	7i41Ckfl2Gfk/F+4y5eUTfgUXaW1SwzBP555izbaG5SQw6ite1g0HwzhjUbxb8wkIG5U31Bw9000Y
	j7GBivg7oZisLjrVKD2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgB1x-0001aD-KJ; Tue, 02 Jun 2020 17:48:53 +0000
Received: from esa3.mentor.iphmx.com ([68.232.137.180])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgB1u-0001Zu-R2
 for linux-snps-arc@lists.infradead.org; Tue, 02 Jun 2020 17:48:52 +0000
IronPort-SDR: O1tOa4qnFNrUQ++Wf9xeEBgLtYQLCBx0AYFNmARyg8A+vyPLSRsG/ayLes5RKZgcoyZfitQ8OE
 3GTlNDwj+bWAOsZwYDGJkRhLKNAPKGdJ8+oVfDreD5NPFHzh3NNxZaZYBxuUs/LFqX+VSyVPUx
 YCurgollSM1J06X6S3KorqpvcISbcJX7D3Hbjo5PziVaUBeBLhmqpw0pBx+2CQu+tEcnMgV6k5
 3oZcgdbd0jtAzAQ+Fkt8cGoref+12TAEPOXhUu2Io0hSOa8kT2BPzoB0mKxz2gWNTfmJxU+zMo
 5MM=
X-IronPort-AV: E=Sophos;i="5.73,465,1583222400"; d="scan'208";a="49433730"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa3.mentor.iphmx.com with ESMTP; 02 Jun 2020 09:48:49 -0800
IronPort-SDR: TTNJ+iWfkSgXjtTAhcvMoDgjgbMjscm1um9TckYsWNTYuGcuImMTTtkE63WyAij16AyxQ+hxsi
 IXunnJJKpIdNis1wD7pfgGMa12hwFKabBs7ywmsmpL1A4moDByrTnjN9tkntr5NG9n1llQTuOc
 nO+H+fE3y0AgORam9Gpi/JFhzRGTCicRHqnXEXGFkS2bYUHP47TXCRoLJGEaW0CkUi96RzoK7o
 r7ZCKZjS0ScW3cLyZvMAUa3P8oIJ6YB9j3ZRFVWe2u8Vwb3Xn7rBvdSD+iHJ5yJ89HYqKIi69U
 cx4=
Date: Tue, 2 Jun 2020 17:48:43 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v6 06/13] ARC: hardware floating point support
In-Reply-To: <91c2aba8-bff5-5ddc-7a95-c93c90883150@synopsys.com>
Message-ID: <alpine.DEB.2.21.2006021746250.3673@digraph.polyomino.org.uk>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-7-vgupta@synopsys.com>
 <de8975a0-bb03-8cec-be97-56f8c4e2a2f3@linaro.org>
 <91c2aba8-bff5-5ddc-7a95-c93c90883150@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_104850_932597_CFAF58D8 
X-CRM114-Status: UNSURE (   4.30  )
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
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, 29 May 2020, Vineet Gupta via Libc-alpha wrote:

> Side question: what do s_ / e_ prefixes mean?
> The suffix is clear s_roundf (float), s_round (double), s_roundl (128).

I don't know what they stand for (the naming convention probably 
originates from fdlibm, or at least much of the code does), but e_* 
functions have a w_* wrapper for error handling round the __ieee754_* 
function in the e_* file (some have since eliminated the use of wrappers 
in some cases) and s_* functions have an implementation with no wrappers 
that does any required error handling itself.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
