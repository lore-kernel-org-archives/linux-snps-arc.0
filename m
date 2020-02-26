Return-Path: <SRS0=BbR1=4O=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C755C4BA13
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Feb 2020 14:48:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23E1021D7E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Feb 2020 14:48:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hcgCGBZj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23E1021D7E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kI6ER9FkRSd+9Sww5/dRzGU62YNcu66OcmfuhG/nRsg=; b=hcgCGBZjKs2Q2i
	S/Tmj/uzpqWXqj40Vqakgrnxa5TCug57cwBtYYrEhdswRHxvyTXLgtTN4cTWF0TbnTtudXtMwMPhN
	l+hncWqMn0sbloj1l0eoWNDwNiWNTUEd1AXo3vNwaMyRRV0ThYKrGSdl7BGYgOFFcdvXUQUhmBCE7
	P1tQpLe956ytCs59fRaH3Jn3P7sqHXGFZgutwDEBQkFdChzgpvwlVJhnOfG0KbsUTMzERMAR5f+nw
	ZKs+kro7Q32NjuzcSLP6nScIBqoitnG4pUVdFQFs09kpXO0WWrcVSo8lat+i6ELqWUvFP1L9Ig8QB
	+8LV/ECHaQO5tnPa4aCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6xzb-0003da-91; Wed, 26 Feb 2020 14:48:55 +0000
Received: from esa3.mentor.iphmx.com ([68.232.137.180])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6xzY-0003d5-C8
 for linux-snps-arc@lists.infradead.org; Wed, 26 Feb 2020 14:48:54 +0000
IronPort-SDR: 9vbA6/3ufQLmbzS5M+fPkNryLF37NvEOEnBfA1Fax37Mji+hWsHNcSg+bpaYJr1I9t8GXGIcUd
 3gxcuqfsL4TheObs23yzmH+QKWVr/QiVzlxSJOxOX9ic/Z+0SHmVnZCUcCvDsbnQf5StdGdDdB
 QNLhf+JNC/l2e1TPXccCOMCBG0G7ezsXj1bB4K7ut3h/525Cz9HNjaBU1Xr3iARXpq69CYmgYs
 OYBpHWU1venjbGaOlU8maKTTMdU21pE9LUPyfwAV4SjqClVWwPeetrhaYko0rFOUDLOpFTP7SQ
 YC8=
X-IronPort-AV: E=Sophos;i="5.70,488,1574150400"; d="scan'208";a="46186137"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa3.mentor.iphmx.com with ESMTP; 26 Feb 2020 06:48:47 -0800
IronPort-SDR: lxmzzW6zbodHB2X6a5JpHbC6FMdPbq+Fm2h2mkG/tta7txxhxxjPRN61PY8gv9BK4+IJhzmTdS
 KI5NASNTtQK0ccznFFwJpyOgUtwxTPBWxuggCtWvnQxm9f3M3+LMflGD1ES2aowhmFX1re3/Qj
 dH7e8k+j1M00AFbYfUmiFi8zHVODYpTADVlwDWd//tAcavhF8XnuHBTHqltOghqdutVlit3Qtt
 BB8DDdjYoxm47qZJPAmhy6SlCxxZyWDg+R6udPNRT0ORUVR/etwHNxXRZEM03lHLp4bRFhA0sO
 suM=
Date: Wed, 26 Feb 2020 14:48:40 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
In-Reply-To: <20200226141842.652ebbcc@jawa>
Message-ID: <alpine.DEB.2.21.2002261445500.5707@digraph.polyomino.org.uk>
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
 <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
 <20200220103716.2f526933@jawa>
 <CAK8P3a2n6fRm4C5Ywyk5ys92jSOAc5SwvBVZyFOY9=4rB2pyjw@mail.gmail.com>
 <20200224100051.2511d797@jawa> <mvmpne4xqpb.fsf@suse.de>
 <20200224111424.33759b2e@jawa> <mvmh7zgxozs.fsf@suse.de>
 <20200224113658.275ea702@jawa>
 <alpine.DEB.2.21.2002242353570.23654@digraph.polyomino.org.uk>
 <20200225123945.10ec1c25@jawa>
 <alpine.DEB.2.21.2002251427240.25788@digraph.polyomino.org.uk>
 <20200226141842.652ebbcc@jawa>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_064852_459813_F7966C53 
X-CRM114-Status: UNSURE (   8.28  )
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
Cc: Florian Weimer <fweimer@redhat.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 GNU C Library <libc-alpha@sourceware.org>, Arnd Bergmann <arnd@arndb.de>,
 Andreas Schwab <schwab@suse.de>, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Helmut Grohne <helmutg@debian.org>, Zong Li <zongbox@gmail.com>,
 debian-arm@lists.debian.org, Alistair Francis <alistair.francis@wdc.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "Maciej W. Rozycki" <macro@wdc.com>, Alistair Francis <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, 26 Feb 2020, Lukasz Majewski wrote:

> > > hidden_def (__mq_timedsend)
> > > weak_alias (__mq_timedsend, mq_timedsend) [**]
> > > hidden_weak (mq_timedsend)  
> > 
> > If you have lib<name>_hidden_weak note you also need a corresponding 
> > lib<name>_hidden_proto, for the name of the weak alias.  But you
> > probably don't need to have lib<name>_hidden* for the weak alias at
> > all, just make sure internal calls use the internal name.
> 
> As fair as I can tell the weak_alias () is necessary for correct
> operation of mq_timedsend when external programs call it.

I wasn't commenting on the weak_alias call, but on the hidden_weak one.

If you have hidden_weak (mq_timedsend), you also need 
lib<name>_hidden_proto (mq_timedsend) in the internal header (and vice 
versa, hidden_proto implies you need hidden_weak).

You don't need hidden_weak (mq_timedsend) unless there is an *internal 
call to mq_timedsend from within the same library that defines it*.

Since such an internal call could just use __mq_timedsend instead, you 
probably don't need hidden_weak / hidden_proto for mq_timedsend.

(If you don't have an internal call to __mq_timedsend, you don't need the 
hidden_* for that name either.)

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
