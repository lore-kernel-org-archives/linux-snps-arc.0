Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A25FC4452B
	for <linux-snps-arc@archiver.kernel.org>; Tue, 21 Jul 2026 08:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KRAeoWngkfH1kyF3YfKGKc3jhlTiLRD8o2oIUtYTAyM=; b=3GQpNBDvKZ5Jts
	Lu8DkV+6zdxjpIbjRF8gV33i13ygrVxrfJLuNuVQMdmTBNqaXtLRi2TCjJkSF/X5/fGOwoVmiuNhi
	WGkJjeD1jD6LES3aKulPIZn126Ak/Gezq5hc6Ebs5SSW9gaMeZ9RrI10N/Xif+3K6YAeFFaKWLhON
	VYp1uJxnK1TwU+/eLKIOW2cTqxgjEUma2SmotVygIiQhj0jv7VCR+5dHaHp4dD3X6DCHd6p4GTRf4
	appG3ZnnoS5Zk+ufLriMMylSCBcu6gNCRlFb+Tw+gSk4VKMnjhKI0PCAfgizzwoEyLLau1RaO2S8Y
	IudtjXlnz3Uio0NDqG6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5fr-00000008mAr-2ewJ;
	Tue, 21 Jul 2026 08:17:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5fl-00000008m8y-1SvW;
	Tue, 21 Jul 2026 08:17:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 684E260A9B;
	Tue, 21 Jul 2026 08:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7485D1F000E9;
	Tue, 21 Jul 2026 08:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784621872;
	bh=T6g9AHg6Msysl37eYnjnLtQmEqUs+OTtZKGs9WFjvSk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gzjjESdF8CyzkjGgzLW39bNILuphzcta3sLi1URSjyAFzJLipC3UmTrXu3jFFA61P
	 pi0PV5sSxroT5MC4vSB4irmB8zkSTQpTKtCfEXUbyhmwF4wWaIQ7lbNCZq0H7DmKFK
	 8I7OxSO8hwMcqfwnwS7791wWvgudq6KYGJc2fT4Fg1b9+hIgTc7vYx2BwdLm81gs4i
	 wUS79qiWoSovsixtK4st1zKQHQc+AVAWsjP8+JuFDiWzJmzXtUEBmK6h+qeN8XDX1T
	 q37KCU+p9yvcznsgWiTAyqiGmNVH8Q7lJHO4++M0Slhqh7kAciZtfiGRWhaqAlyvHz
	 9t2nZgwHDG8hg==
From: Thomas Gleixner <tglx@kernel.org>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, Shrikanth
 Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook
 <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, Mark
 Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Andy
 Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Guo
 Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger
 <richard@nod.at>, Chris Zankel <chris@zankel.net>,
 linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann
 <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, Will Deacon
 <will@kernel.org>, Brian Cain <bcain@kernel.org>, Michal Simek
 <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>,
 linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
 linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, Michal =?utf-8?Q?Such=C3=A1nek?=
 <msuchanek@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 00/18] entry: Consolidate and rework syscall entry handling
In-Reply-To: <CA+=Fv5Sd5+-K3-MOiEc2N8z_5CoLQPVPUwjiugSj3u8cBWJXXQ@mail.gmail.com>
References: <20260707181957.433213175@kernel.org>
 <CA+=Fv5TDNH8+JAojV9_W36kUkEE68uiA00FQ7i0vJunebqs1sA@mail.gmail.com>
 <87wluplb6k.ffs@fw13>
 <CA+=Fv5Sd5+-K3-MOiEc2N8z_5CoLQPVPUwjiugSj3u8cBWJXXQ@mail.gmail.com>
Date: Tue, 21 Jul 2026 10:17:49 +0200
Message-ID: <87ecgwlpsi.ffs@fw13>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

TWFnbnVzIQoKT24gVHVlLCBKdWwgMjEgMjAyNiBhdCAwMDowMSwgTWFnbnVzIExpbmRob2xtIHdy
b3RlOgo+IE9uIE1vbiwgSnVsIDIwLCAyMDI2IGF0IDk6MjHigK9QTSBUaG9tYXMgR2xlaXhuZXIg
PHRnbHhAa2VybmVsLm9yZz4gd3JvdGU6Cj4+IElmIHlvdSB3YW50IHRvIGJhc2UgeW91ciBzdHVm
ZiBvbiB0aGF0IGZvciA3LjMsIEkgY2FuIGFkZCBhIHRhZyB3aGljaAo+PiBtYWtlcyBpdCBpbW11
dGFibGUgc28gaXQgY2FuIGJlIHB1bGxlZCBpbnRvIHRoZSBhbHBoYSB0cmVlLgo+Cj4gWWVzLCBw
bGVhc2UuIFRoZXJlIGlzIHN0aWxsIHNvbWUgb25nb2luZyB0ZXN0aW5nL3JldmlldyBvZiBteSBB
bHBoYQo+IEdFTkVSSUNfRU5UUlkgc2VyaWVzLCBidXQgYXNzdW1pbmcgaXQgaXMgcmVhZHkgaW4g
dGltZSBmb3IgdGhlIDcuMyBtZXJnZQo+IHdpbmRvdywgYW4gaW1tdXRhYmxlIHRhZyB3b3VsZCBi
ZSB2ZXJ5IGhlbHBmdWwuCgpIZXJlIHlvdSBnbzoKCiAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC90aXAvdGlwLmdpdCBjb3JlLWVudHJ5LWZvci1hcmNoLTA3
LTIxLTI2CgpUaGFua3MsCgogICAgICAgIHRnbHgKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1z
bnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
