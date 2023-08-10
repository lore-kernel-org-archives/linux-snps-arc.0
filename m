Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5814AC001B0
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Aug 2023 15:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WGWv/YpDWMbudlGUvTMQpKK6Lo3BFPTtySox2T9UQh8=; b=MaT+aolZky4Khh
	ic7EEag1nVDopOoJEry/Sz1+roHDO+51v5I2hMQUD7MR9eLKRvy+cgdt5IssBFo/MUX8eqzso25L2
	UbPku1aZ63TkAB7I5s+yNhfNR9bATzpgs4h5VJSMmpemEy/4Y5o9cPy/5C4NlYYND1MJvs+hFIwq+
	H33jzHI7X2hpajrCpD9zAGVwj0F9jT5CKjphuRTQdxGzfIQil70OhD/pE7T1idikUEP1JxJu2Y37q
	Fw8XgFyr6L8+0/o02a1GqSL8WQ5q5q0xPaTZ/icwgLuXBCo6W9tNVvDEFE2v473xu0airqN/Vtf8x
	k0ad46+1FSkJLeMIgB3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU7Tw-0082DO-14;
	Thu, 10 Aug 2023 15:21:48 +0000
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU7Tq-0082Am-2x;
	Thu, 10 Aug 2023 15:21:45 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 0309F2B0006F;
	Thu, 10 Aug 2023 11:21:30 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 10 Aug 2023 11:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1691680890; x=1691688090; bh=2Q9/wkZuAqGaPUlwVeMbpzA59zc+JfHIktY
	O4gpFXEA=; b=WaZbjPkbWQTw/Kf2GbxPG2OASHHeun5g4F7gn2VAEgpGvcX0iMu
	Yw0WcMwRh4u1WV4pBE6G9uTk6MBB1dHJPrup2veNETaNRO4oXcOwjESAxciFeXUF
	NauwO6Sukf1PFU6n0dXj9QwDqEjC3yTVa/w2d1Z+R/Lzx9G+jHPwmqmOALDamhoy
	LokVRo/3XJA/fz4elEi/N4oOHCD5jy/+LOLlrBT72HRzrUQMflIB9nCojHr3HV4V
	Bufj00VwtXfkV8gZUYB1yOODPXrQiq9tc3T6Krw40UUEVjEXLieszjT3Yd4H4cMT
	MrVsC0HBw1VVqSLHPxz8DspNnyagPvKPT+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1691680890; x=1691688090; bh=2Q9/wkZuAqGaPUlwVeMbpzA59zc+JfHIktY
	O4gpFXEA=; b=caURWnRu3gf0f21Yq3EgOaFoF+0+LEChkA/MJtT7YyI3LV5m714
	4AucINkfhCH/7l0itz81/PZRqQz7EAICfLWp1KH4uz3/nPIypmwec+6pl6I3Ll49
	OPYyMXA27Ii23LIoE2xFAFvebrEnkzvYkLxRMudMaTWmzMB5+4Cd86S8O3blz3yo
	+b1lCYhCQmweIMavk1YUR0R7t5SBxLH5dG8SARL+wYMvkb0grNmeqKPd2XWugH8X
	mJnjkDjSrWQbEKTaRwOxRyK2KArevNSNHEv6DnTdI3M9Iv/VoowyoU7rBt/lK3EY
	ZC4CmhZWc92gA0m7hdP28Pr3eJNx5IJRXlA==
X-ME-Sender: <xms:dgDVZOAmUZploME3CLq3HZRMQE4QF5V2nxBOwAhebfW0oyhrg9k5iw>
    <xme:dgDVZIjp8Pugzv1JIZus0_sAHJ1jDJTEp8r0b7zSeedRyu3Ev7fFT8v0-uwcR-QCc
    TbfuB2HS1B8qD32Kr0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrleeigdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:dgDVZBn3I-iMvlOntn7ATyfucXnmWrnWjaGUohfSfMDg9Qb0QW1mxA>
    <xmx:dgDVZMwXQOXhXLAW6qfOKa0qszZ5dfXqRjoeRDqjjkVhVGYsMbtMcQ>
    <xmx:dgDVZDQu_0VF8vXhFA1cC5gb_f5vhwP0-PjsxB5iBMF55DenRJYJTQ>
    <xmx:egDVZM4t-G0JekS6nLs-RFM29qi33z0HkDEZQ9gpEQ8eCfehGA1sWwPehLM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 47DE4B60089; Thu, 10 Aug 2023 11:21:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <a6222c7f-f903-4de5-821a-f90da8ad1dc9@app.fastmail.com>
In-Reply-To: <e0c2f7b1-b137-fbd3-aa28-808498eb8e3f@csgroup.eu>
References: <20230810141947.1236730-1-arnd@kernel.org>
 <20230810141947.1236730-17-arnd@kernel.org>
 <e0c2f7b1-b137-fbd3-aa28-808498eb8e3f@csgroup.eu>
Date: Thu, 10 Aug 2023 17:21:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "Matt Turner" <mattst88@gmail.com>, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, guoren <guoren@kernel.org>,
 "Brian Cain" <bcain@quicinc.com>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Jonas Bonn" <jonas@southpole.se>,
 "Stafford Horne" <shorne@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "x86@kernel.org" <x86@kernel.org>, "Borislav Petkov" <bp@alien8.de>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>,
 linux-next <linux-next@vger.kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
 "Stefan Kristiansson" <stefan.kristiansson@saunalahti.fi>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Chris Zankel" <chris@zankel.net>, "Max Filippov" <jcmvbkbc@gmail.com>,
 "Christian Brauner" <brauner@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Youling Tang" <tangyouling@loongson.cn>,
 "Tiezhu Yang" <yangtiezhu@loongson.cn>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>,
 "Zhen Lei" <thunder.leizhen@huawei.com>, "Xin Li" <xin3.li@intel.com>,
 "Nhat Pham" <nphamcs@gmail.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Marc_Aur=C3=A8le_La_France?= <tsi@tuyoix.net>,
 "Johannes Weiner" <hannes@cmpxchg.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 16/17] [RFC] arch: turn -Wmissing-prototypes off conditionally
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_082142_986097_FBCF2827 
X-CRM114-Status: GOOD (  20.01  )
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

T24gVGh1LCBBdWcgMTAsIDIwMjMsIGF0IDE2OjU5LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+
IExlIDEwLzA4LzIwMjMgw6AgMTY6MTksIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoKPj4gRnJv
bTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPj4gCj4+IEkgaGF2ZSBjbGVhbmVkIHVw
IHRoZSAtV21pc3NpbmctcHJvdG90eXBlcyB3YXJuaW5ncyBmb3IgbW9zdCBvZiB0aGUgbWFqb3Ig
YXJjaGl0ZWN0dXJlcwo+PiBhcyB3ZWxsIGFzIGFsbCBkcml2ZXJzIHRoYXQgZ2V0IGVuYWJsZWQg
Zm9yIENPTkZJR19DT01QSUxFX1RFU1QsIHNvIG5vdyB0aGVzZSBzaG91bGQgYmUKPj4gY2xvc2Ug
dG8gZml4ZWQgb24geDg2LCBhcm0sIGFybTY0LCBwb3dlcnBjLCBzMzkwLCBhbmQgcmlzY3YuCj4+
IAo+PiBUaGUgb3RoZXIgYXJjaGl0ZWN0dXJlcyB0ZW5kIHRvIGhhdmUgYSBsb3Qgb2YgdGhlc2Ug
d2FybmluZyBpbiBhcmNoaXRlY3R1cmUgc3BlY2lmaWMKPj4gY29kZSwgcHJpbWFyaWx5IGZyb20g
ZnVuY3Rpb25zIHRoYXQgYXJlIG9ubHkgY2FsbGVkIGZyb20gYXNzZW1ibGVyIGNvZGUgYW5kIGRv
Cj4+IG5vdCBvdGhlcndpc2UgbmVlZCBhIGRlY2xhcmF0aW9uIGJ1dCBzdGlsbCBjYXVzZSBhIHdh
cm5pbmcgd2l0aG91dCBvbmUuIE90aGVyIGNhc2VzCj4+IGFyZSBzaW1wbHkgZnVuY3Rpb25zIHRo
YXQgc2hvdWxkIGp1c3QgYmUgc3RhdGljIG9yIGFyZSBtaXNzaW5nIGFuICNpbmNsdWRlIHN0YXRl
bWVudC4KPj4gCj4+IEluIG9yZGVyIHRvIGJlIGFibGUgdG8gdHVybiB0aGUgd2FybmluZyBvbiBn
bG9iYWxseSBieSBkZWZhdWx0IHdpdGhvdXQgYnJlYWtpbmcgYWxsCj4+IHRoZXNlIGFyY2hpdGVj
dHVyZXMsIGFkZCBhIGxpc3Qgb2YgZXhjZXB0aW9ucyBmb3IgYXJjaGl0ZWN0dXJlIGRpcmVjdG9y
aWVzIHRoYXQKPj4gY2FuIHJldmVydCBiYWNrIHRvIHRoZSBvbGQgYmVoYXZpb3Igb2Ygbm90IHdh
cm5pbmcgYmFzZWQgb24gYSBuZXcKPj4gQ09ORklHX1dOT19NSVNTSU5HX1BST1RPVFlQRVMgb3B0
aW9uLgo+Cj4gU29tZSBhcmNoaXRlY3R1cmVzIG9ubHkgaGF2ZSBhIGZldyBvZiB0aG9zZSBlcnJv
cnMvd2FybmluZ3MuCj4KPiBGb3IgaW5zdGFuY2UgbWljcm9ibGF6ZSBhbmQgcGFyaXNjIG9ubHkg
aGF2ZSBvbmUgZWFjaC4gSXNuJ3QgaXQgYmV0dGVyIAo+IHRvIGZpeCB0aGVtIHJhdGhlciB0aGVu
IHR1cm4gdGhlIGVycm9ycyBvZmYgPwoKVGhlIGxpc3Qgd2FzIG9ubHkgdGhlICdkZWZjb25maWcn
IHdhcm5pbmdzLCB0aGVyZSBhcmUgYSBjb3VwbGUgbW9yZQp0aGF0IEkgc2F3IHdpdGggJ2FsbG1v
ZGNvbmZpZycsIGFuZCBJJ20gc3VyZSB0aGVyZSBhcmUgZXZlbiBtb3JlCndoZW4gZGVhbGluZyB3
aXRoIG90aGVyIHJhbmRvbSBjb25maWd1cmF0aW9ucy4KCkkgZGlkIHNlbmQgb3RoZXIgZml4ZXMg
Zm9yIG1pY3JvYmxhemUgYW5kIHBhcmlzYyBzcGVjaWZpYyBkcml2ZXJzLAphbmQgSSBjb3VsZCBh
bHNvIHNlbmQgcGF0Y2hlcyBmb3IgdGhlIHR3byBkZWZjb25maWcgd2FybmluZ3MgaWYKdGhlIG1h
aW50YWluZXJzIGFyZSBoYXBweSB3aXRoIGZpeGluZyB0aG9zZSBidXQgbGVhdmluZyBhbGxtb2Rj
b25maWcKdG8gc3RpbGwgd2FybiwgYnV0IEkgZmVlbCB0aGF0IGl0J3MgZWFzaWVyIGZvciB0aGVt
IHRvIGp1c3QKZG8gdGhlIGxhc3QgZml4ZXMgdGhlbXNlbHZlcyBhbmQgdGhlbiByZW1vdmUgbXkg
aGFjayBhZ2Fpbi4KCkknbGwgd2FpdCBmb3IgTWljaGFsIGFuZCBIZWxnZSBvbiB0aGVzZS4KCj4g
T3RoZXJzIGxpa2UgbG9vbmdhcmNoIHdoaWNoIGlzIGEgcmVjZW50IGFjdGl2ZWx5IG1haW50YWlu
ZWQgCj4gYXJjaGl0ZWN0dXJlLCBJJ2QgZXhwZWN0IHRoZSAzMCBlcnJvcnMgdG8gYmUgZWFzeSB0
byBmaXguCgpBZ3JlZWQsIHRoZXkgcHJvYmFibHkgYXJlLgoKPiBNYW55IG9mIHRoZSBhbHBoYSBv
bmVzIHNlZW1zIHRvIGJlIGJyb3VnaHQgYnkgeW91ciBjb21taXQgZTE5ZDRlYmM1MzZkIAo+ICgi
YWxwaGE6IGFkZCBmdWxsIGlvcmVhZDY0L2lvd3JpdGU2NCBpbXBsZW1lbnRhdGlvbiIpCgpBcyBm
YXIgYXMgSSBjYW4gc2VlLCB0aG9zZSBhbHJlYWR5IGV4aXN0aW5nIGJlZm9yZSB0aGF0IHBhdGNo
LCB0aG91Z2gKSSBkaWQgdG91Y2ggdGhlIHNhbWUgbGluZXMgdGhlcmUuCgpJbiB0aGUgZW5kIGl0
J3MgYSBtYXR0ZXIgb2Ygd2hlcmUgdG8gc3RvcCwgYXMgdGhlcmUgYXJlIGVuZGxlc3MKY29uZmln
dXJhdGlvbnMgdG8gdGVzdCBpZiBJIHdhbnQgdG8gZG8gYSBjb21wbGV0ZSBqb2IuIEkgZHJldyB0
aGUKbGluZSBiZXR3ZWVuIHBvd2VycGMgKHdoaWNoIEkgdHJpZWQgdG8gZml4KSBhbmQgbWlwcyAo
d2hpY2ggSSBsZWZ0CmFsb25lKSwgbWFpbmx5IGJlY2F1c2UgdGhlIHBvd2VycGMgc2lkZSB3YXMg
YWxyZWFkeSBleGhhdXN0aW5nCmFuZCBtaXBzIGhhcyBldmVuIG1vcmUgb2JzY3VyZSBjb25maWd1
cmF0aW9ucy4gVGhlIG90aGVyIG9uZXMgb24KdGhlIGxpc3QgYXJlIGFsbCBsZXNzIGFjdGl2ZWx5
IG1haW50YWluZWQgdGhhbiB0aGVzZSB0d28uCgogICAgIEFybmQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlz
dApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
