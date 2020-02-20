Return-Path: <SRS0=2k9h=4I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9822BC5ACC4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 00:47:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61A702465D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 00:47:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h9FfZm3Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61A702465D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWSafWFcdFnVgz+GhXxG4o+7FsaVIlVMbv2hXDWvPpc=; b=h9FfZm3QRFkMM5
	JAZyqqJoIiAKvDXdXWSo0ZZwsXuyEZr0zCZnCAO7bSvQaqHjVX66SKhKQBskZzl8NilJvPqpt9GJR
	XCZq1mTMD++UYbpMWYKFm2Rg5fkR0Ph4K35IuOExCPtI7eXU8p45QdZaWJoh9fN2zb+6Odu4D0MTz
	s5qIaaGS+VD/O/ZMIBTFFi8Gss+5ik99inD08/OQAKO73uaQSdoktwurKvArKr53zlTJENoP9MuuO
	waUOzIDTxym2PyN3N5X3zv39q8xyA+8NuWVsW5nWRa4iDMz/5rVVRf/Bv9t/Q+SzmLjhGfusjQX6P
	FlmSlHQ6jMx9suXedgdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4Zzh-0006pG-17; Thu, 20 Feb 2020 00:47:09 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4Zzd-0006oj-S4
 for linux-snps-arc@lists.infradead.org; Thu, 20 Feb 2020 00:47:07 +0000
IronPort-SDR: F+bVL3GYqs0IzKiTpaGFXtti/6rLnxI/96Zr5Mib2InAGtXVrhrpzinJaANFy8cU/AAx2h7Nso
 owaPSq1QaGxgNJmIuJRLfuv+KznqrjsgQqEd//hISY1LnzcItCxBgM0cTjJjMlDL0xxE0Um4Xf
 BuK/EjrHNbRR1Zzd2vIDODRHxaI9lDQNO7pykXaPtZBOr07QQ1l25i65HZrYl586XEpmw0nlve
 lDKcSfcspEyx0xdVxiC90f5f6SVKWhVYd22GupBHhFk45RSJblH4aWU6K9sfQvB/t10OdgyCt/
 2qM=
X-IronPort-AV: E=Sophos;i="5.70,462,1574150400"; d="scan'208";a="47924545"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 19 Feb 2020 16:46:48 -0800
IronPort-SDR: QUGxWYi4GGz8lvHHf7kmJULSSjDyc0unxfQUvMsimrzJyb4k3CrkDJdRylj3DRqHdTCMGD63uO
 26kawwOOlOa1hjAzDcpgBFAmjAJ6uRX84kUz806e2KKSZJNuZbXD8RcP7xgfE6Ca/U+T+tAYhJ
 GVliWm2aH/4AXKbXRYMUtcvs7OWhmONxYktHUF2E3hNgaD9iiyGvfxQaIu/tl7YvnieEczGhlu
 rq4fADcZbVYgEe9QViF/WE0cqKFu7Mx6uiVUcRjZXaBXpN7C7oBOb4x5CzGy2xcwf/N9CHWsOO
 pzw=
Date: Thu, 20 Feb 2020 00:46:41 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [RFC v6 07/23] RISC-V: Use 64-bit time_t and off_t for RV32 and
 RV64
In-Reply-To: <de8f8e28-630f-7b87-1a96-6131588a0346@synopsys.com>
Message-ID: <alpine.DEB.2.21.2002200044040.28780@digraph.polyomino.org.uk>
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <67f2298c-30ab-1508-4a10-6ee285df7ad1@synopsys.com>
 <CAKmqyKO6u15cDbQQ644GrABi=6WWQsNLiCVLszrmDCdcWBnCPA@mail.gmail.com>
 <c9f11e9e-7c33-0000-e32c-346d425d7c69@synopsys.com> <mvmimk3567z.fsf@suse.de>
 <8239db87-d736-a6e2-913d-c1e5e937688f@synopsys.com>
 <20200220001822.703ee8a1@jawa>
 <de8f8e28-630f-7b87-1a96-6131588a0346@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-05.mgc.mentorg.com (139.181.222.5) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_164705_918121_B22C1D0F 
X-CRM114-Status: UNSURE (   4.32  )
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
 "arnd@arndb.de" <arnd@arndb.de>, Andreas Schwab <schwab@suse.de>,
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

On Thu, 20 Feb 2020, Vineet Gupta wrote:

> The first 4 will need more work as sym aliasing like
> 	strong_alias (__xstat64, __xstat)
> 
> will be needed in those ARM files (which in turn use i386).

The situation for Arm is fundamentally different from that for ARC.

For ARC, you only need a single public stat structure (using 64-bit times 
and offsets).

For Arm, a third public stat structure will need to be added alongside the 
existing two, initially used internally in 64-bit-time stat functions that 
aren't exported from glibc, eventually to be used with _TIME_BITS=64 with 
the 64-bit-time stat interfaces exported once all the _TIME_BITS=64 
interfaces are ready.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
