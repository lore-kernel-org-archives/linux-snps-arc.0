Return-Path: <SRS0=2k9h=4I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9157C11D05
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 14:14:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C1CF206E2
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 14:14:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kxiZmyV8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C1CF206E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZ0Xp7sHFIBE0y9I76WTFsT1aO6j403JjDCbd+jwoOA=; b=kxiZmyV8xTEiq3
	u8NvG6fVd0gO7qUjKcdoKfw5xT7t8sV5UdxdtyF8Kv+kAQ88sAanzBdqsPRIxFQv8qM+ePXezoLFT
	7CJ4NhXoqC7pK++KXpIH/s9GeApOxV7QkieTltZ6N9OYyRBK5M0MPlNjcGKV0KWqf/ek/AKHaxf9y
	W1A/oZLd+uKocnKJtMIuHWa78mZzpal5hbRkvNDr+TQQ451jyJwogA4/UBrzi/MdEphhx/cauAKiU
	o7V0lrsa9EpePCamabd8glqLMLfBS2vPfEIXJVS1vj4h+FKTVp/ZE24YBAb9BKExBf98TVZOHCfsV
	1nx2O7z532fefTfoSe1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4may-0001HY-1I; Thu, 20 Feb 2020 14:14:28 +0000
Received: from esa4.mentor.iphmx.com ([68.232.137.252])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4mav-0001H6-8S
 for linux-snps-arc@lists.infradead.org; Thu, 20 Feb 2020 14:14:26 +0000
IronPort-SDR: QFrnNIH9RCbZUk8h1IqaMXNnJhyP6PjVqe5ccW/jVWfxHMrKMo4MO48jE9DqZ20+POszNmcszj
 0qPU0ouxJDNddC2F2iEKyi+QqrCmb6oV5LTMj+KsRgRD/WY7Foimupmw3hlAzYILGUT/hV9Ysx
 GbwdptKn39HD9V51xE73r2l2dI5XfuNpmO83kh1ZDN9LWYNKVGly0HhcV71wtNp2JCJE8rcnoI
 jdGfPadNFSwatfZDnxkzuMpt6C6GmIJl0VMg8RtZOsVdQm483qaUjWb++/GFwdIlKXQbpk0o+u
 xF4=
X-IronPort-AV: E=Sophos;i="5.70,464,1574150400"; d="scan'208";a="46062073"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa4.mentor.iphmx.com with ESMTP; 20 Feb 2020 06:14:21 -0800
IronPort-SDR: WEdXogao7z3bBrnVdLYKUpOPcjUjVG/wqGV+Y1QUGeSDhHp0KILLQYZDRabwgUlKb/L/U+/S/D
 kzJgsz0TEqDK2RzYbReyjMbMet/xo/tE6i6eAoeC5vKVS0dG0/OFHM/8AMY7GqZ9lNh5/oqHDt
 pMY8elJIynsY9Ow+vVhmzXX6Cki52DzJLnDHjyKgECWcpMdU8G0JB9K3RQN0xF6Q1e77+DZ8oJ
 6MDBhOrldZDQl3g/QUkviM/cutBbnzRiW/oHFWz974ZrnsX9jZJj11Jf8t4PPLF9kImnRa+pTr
 1ro=
Date: Thu, 20 Feb 2020 14:14:13 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC v6 07/23] RISC-V: Use 64-bit time_t and off_t for RV32 and
 RV64
In-Reply-To: <CAK8P3a3MTQf_fnEWiGVxzexZzYNQ34h29aNxH_YApmsVzY6OsA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2002201410010.19621@digraph.polyomino.org.uk>
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <67f2298c-30ab-1508-4a10-6ee285df7ad1@synopsys.com>
 <CAKmqyKO6u15cDbQQ644GrABi=6WWQsNLiCVLszrmDCdcWBnCPA@mail.gmail.com>
 <c9f11e9e-7c33-0000-e32c-346d425d7c69@synopsys.com> <mvmimk3567z.fsf@suse.de>
 <8239db87-d736-a6e2-913d-c1e5e937688f@synopsys.com>
 <20200220001822.703ee8a1@jawa>
 <de8f8e28-630f-7b87-1a96-6131588a0346@synopsys.com>
 <alpine.DEB.2.21.2002200044040.28780@digraph.polyomino.org.uk>
 <CAK8P3a3MTQf_fnEWiGVxzexZzYNQ34h29aNxH_YApmsVzY6OsA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_061425_345972_E4B79ECE 
X-CRM114-Status: UNSURE (   6.61  )
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
Cc: "fweimer@redhat.com" <fweimer@redhat.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 Andreas Schwab <schwab@suse.de>, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "palmerdabbelt@google.com" <palmerdabbelt@google.com>,
 Lukasz Majewski <lukma@denx.de>, "zongbox@gmail.com" <zongbox@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "adhemerval.zanella@linaro.org" <adhemerval.zanella@linaro.org>,
 "macro@wdc.com" <macro@wdc.com>, Alistair Francis <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, 20 Feb 2020, Arnd Bergmann wrote:

> But surely that structure layout would be the same on ARM and ARC
> as well as all other 32-bit architectures with _TIME_BITS=64, right?

Yes.

> What's wrong with having a single implementation for the most
> recent set of stat syscalls, with the older variants being only compiled
> for architectures that need them to support _TIME_BITS=32 and/or
> _FILE_OFFSET_BITS=32?

The ARC case should be a very simple patch, just changing a few 
conditionals so the statx path can be used on an architecture that also 
has the old syscalls.  No conditionals for whether to build a particular 
stat function, or for what that function is called, will be needed.  No 
conditionals for whether a syscall is available at runtime will be needed, 
because at least initially the port will be assuming Linux 5.1 or later.

In the Arm case, the code will need to allow for runtime fallback to old 
stat syscalls on kernels without statx, and will need to build the 
function using the new layout under a new name.  That's a much more 
complicated change that can build on top of the ARC change.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
