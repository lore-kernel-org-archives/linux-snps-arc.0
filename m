Return-Path: <SRS0=AhAi=4N=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0F0C35E01
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 14:37:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CE1C21744
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 14:37:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bH5A3OOL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CE1C21744
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OXlUPrthud0KGukDBkc+7nTth9ERb040o5ZxNhHPFz0=; b=bH5A3OOL4RJQ00
	uw9rNT1AY3v2QgKaHlShn4bClE5baVMO8Gfea8rX3q88GR2cyUecf8gSB1rDgBODJvYYhaPDcct5K
	NDjhF+Ixms/sitalCwll93u5nmBBJCvXGsTLo4/YEbBVtmsgP2u4Kp+s44h8gP3qzMMltZAOBmySW
	vI8Y0fn0YQUPmoc5xYaPY+TtsxMtPxW1Sbgr1v4VrXjcg49zY28+bgXEpcZGhXKFJxQTrnzNMF+/u
	g0PNnuAYAAM5dT4wcF5cqF+XXsGsfeceTKU27yPbEZHsGH6gzUZA0t0flEsxjGYyb8Gd5QyaR9sDf
	ryJVBR2+hnPPGJp7KIsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6bKY-00047O-BZ; Tue, 25 Feb 2020 14:37:02 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6bKV-000472-Kj
 for linux-snps-arc@lists.infradead.org; Tue, 25 Feb 2020 14:37:01 +0000
IronPort-SDR: jKgxjic9CDDU5Y5mMKIeOORGwPg+DMS8J7Ja3wsBs+7yas+PYPraLPGAD585zJ270mWiUbw9VA
 bMG/s6R4W1ngUD6Ei+oTudPOHfQX9Hw9H1SPofk/Ct6U8XfbkXcypjizk7pDvT86Z2W54UDDoW
 ChJHGmqL/yHaS4MY4cvgh02LyCN8Ctx0MNRwR6046l8NEc1/0h4fbxByOLO0+tzw6xczzdCE7Q
 R0XR9rldTID9Aj8Ymmu6r8iHlal/btJ2KBr+YZuaqouA4BOQkNYizVlBJl20RihjTw9uBMok7w
 6tM=
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="48078231"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 25 Feb 2020 06:36:54 -0800
IronPort-SDR: /ClwbW/SmOMkktyKV4s3/0TsTMTcGeokbwl2WyElDzXfL5kD/phGeTAaH8VsAF3y+a8ksKWGQD
 NwEQFxavhZJ9JFYci2jqnfX1QZcACuB76imQRn4dZdYpTgsY1xe5hP3J57IkpA1XhKOltieUfT
 012GWmejGs4HqYXvnMbWqL4ZoF53wPRtNGD/VH81qmoA2zPiQfZaQe6cIrJTatGt9NDqBIWkO8
 o5G2TA5TjlUZ35ecSzQUgV2yPwNaqjK4eIv1VZGPKJOwqldkg/cyNeTLkvBqpSTeoZL0tsdFix
 +/s=
Date: Tue, 25 Feb 2020 14:36:48 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
In-Reply-To: <20200225123945.10ec1c25@jawa>
Message-ID: <alpine.DEB.2.21.2002251427240.25788@digraph.polyomino.org.uk>
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
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
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_063659_688515_01A7816D 
X-CRM114-Status: UNSURE (   8.55  )
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

On Tue, 25 Feb 2020, Lukasz Majewski wrote:

> Lets consider for example __mq_timedsend_time64.
> 
> With lib<name>_hidden_def/proto kept (NOT removed as in [1]):
> GDB:
> __GI___mq_timedsend_time64   [*]
> 
> (No build errors, linking with test setup works as expected).

What is the actual testcase, and the exact command line used to compile 
it?

_TIME_BITS=64 redirection is only relevant for programs built with glibc, 
using the installed headers - not for building glibc itself.

lib<name>_hidden_proto is only relevant for building glibc, with its 
internal headers - not for programs built with glibc.

If you're talking about a glibc testcase, such tests should be in tests 
not tests-internal, so _ISOMAC is defined when they are built, so the 
glibc internal headers just wrap the public ones without defining anything 
else.  In particular, the asm redirections from public headers should be 
in effect when tests are compiled, but not the lib<name>_hidden_proto 
redirections (but even for internal tests, lib<name>_hidden_proto 
shouldn't do anything because the build process knows they are tests not 
part of libc).

You should look at the preprocessed source from building the test with 
-save-temps and find out why the asm redirection from the public header 
isn't being effective (or if it is effective in the .o file for the test, 
look at what happens afterwards in glibc).  Since lib<name>_hidden_proto 
should not be called in the parts of headers included when building a 
test, its presence or absence should have no effect on the preprocessed 
source of the test.

> hidden_def (__mq_timedsend)
> weak_alias (__mq_timedsend, mq_timedsend) [**]
> hidden_weak (mq_timedsend)

If you have lib<name>_hidden_weak note you also need a corresponding 
lib<name>_hidden_proto, for the name of the weak alias.  But you probably 
don't need to have lib<name>_hidden* for the weak alias at all, just make 
sure internal calls use the internal name.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
