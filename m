Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5569E606A319
	for <linux-snps-arc@archiver.kernel.org>; Fri, 23 Oct 2026 00:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BORkVGyZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026092801 header.b=B0iR0guj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zjIA7rUC5MzZWOO41OArgqg374xr534GcSVDtX7Xih0=; b=BORkVGyZ/mOxgi0NABCPcxnFfQ
	WZWBZhXfI5x80DvkW1wnIyitdK2eW+rzMPY+TZR7pSzYQtAndllCtT8TOABY7uby+EhdrP+mWNPSo
	Sg9dqxuVQOKw3wYuWRmrIH4wha/eSqHBaBU+LMYCNyw9Dg42JFSFgRbl47lISV6LYmL+1d6yc/+VE
	8CNtifAXK77LykWe/YKwWW8Atk8S7C9oZPt9F85Ybs/jywykPisFReBTKkNC+Di83DHkyToM/KQr+
	VQkLvjBze6PZr4F4Ruu/CEPUhG8mukJX7oh08HvBsIyBXJUTbemzSqZf5wp6A7kTRRtd3DNP0BEpK
	sQOPLVdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK34K-0000000FDWa-2Mwi;
	Fri, 23 Oct 2026 00:23:36 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK34H-0000000FDW5-3mrs;
	Fri, 23 Oct 2026 00:23:35 +0000
Received: from ehlo.thunderbird.net (ENVISION-AE.edge1.SanJose1.Level3.net [4.79.220.182])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 69N0MTYe1497671
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 22 Oct 2026 17:22:30 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 69N0MTYe1497671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026092801; t=1792714955;
	bh=sewWTjP+M6E94TwmQI+LvxiP3Dgk+UiInUJ1sYqPvjE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=B0iR0gujNC7PBahAQGPELPfOvA7wFnm4aVgauSDh6Mr2eGjg9f2sjLSQ7t78E+yy1
	 f8bIVvq6KYitlu1MNVZc3rKXjku7b5th05mhKR3968auNM3tY5s5Ser+GgoQNITSum
	 ZADmFoGGs0IzvcRHHbEEE6rPcUpxXrq+3jB2dvktUZRlLHRQfdXJNzBfWoR9LWTL/0
	 Vfr9nrAF6Af+MSU3LPirKQDCQPLvyBm4AXAwcmc36BGcccEuO+/ctQAGEZb2pFmtOB
	 9hRTTHAao28lytaVTDSTMgSi2sQxwQH+82H9bDetNn7xdIGgwxNjxXV+Ny1OiYpDe8
	 //k9lsYxpZvPw==
Date: Thu, 22 Oct 2026 17:22:24 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Thomas Gleixner <tglx@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-m68k@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
        Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
        Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
        linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org,
        =?ISO-8859-1?Q?Michal_Such=E1nek?= <msuchanek@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5Bpatch_16/18=5D_x86/entry=3A_Get_rid?=
 =?US-ASCII?Q?_of_the_sys=5Fni=5Fsyscall=28=29_indirection?=
User-Agent: K-9 Mail for Android
In-Reply-To: <87cxt11ktr.ffs@fw13>
References: <20260707181957.433213175@kernel.org> <20260707190254.493733289@kernel.org> <20261022142425.3Wx-RrU5@linutronix.de> <87fqxx1r80.ffs@fw13> <87cxt11ktr.ffs@fw13>
Message-ID: <1149A39E-BEBA-46EA-94F4-4DFFC4733EF5@zytor.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_172333_968099_EB6E124A 
X-CRM114-Status: GOOD (  28.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gT2N0b2JlciAyMiwgMjAyNiAyOjM0OjA4IFBNIFBEVCwgVGhvbWFzIEdsZWl4bmVyIDx0Z2x4
QGtlcm5lbC5vcmc+IHdyb3RlOgo+T24gVGh1LCBPY3QgMjIgMjAyNiBhdCAyMToxNSwgVGhvbWFz
IEdsZWl4bmVyIHdyb3RlOgo+PiBPbiBUaHUsIE9jdCAyMiAyMDI2IGF0IDE2OjI0LCBTZWJhc3Rp
YW4gQW5kcnplaiBTaWV3aW9yIHdyb3RlOgo+Pj4gT24gMjAyNi0wNy0wNyAyMTowNzowMSBbKzAy
MDBdLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4+PiB8W1JVTl0gICAgICAgICAgIENoZWNraW5n
IG91dCBvZiByYW5nZSBzeXN0ZW0gY2FsbHMKPj4+IHxbRkFJTF0gICAgICAgICAgICAgICAgICB4
MzIgc3lzY2FsbCAxOi02NCByZXR1cm5lZCAtOTk5OSwgYnV0IGl0IHNob3VsZCBoYXZlIHJldHVy
bmVkIC1FTk9TWVMKPj4+IHxbRkFJTF0gICAgICAgICAgICAgIHgzMiBzeXNjYWxscyAxOi02NC4u
LTIgaGFkIDYzIGZhaWx1cmUKPj4+IHxbT0tdICAgICAgICAgICAgICAgIHgzMiBzeXNjYWxsIDE6
LTEgcmV0dXJuZWQgTU9ESUZJRURfQllfUFRSQUNFIGFzIGV4cGVjdGVkCj4+PiB8W0ZBSUxdICAg
ICAgICAgICAgICAgICAgeDY0IHN5c2NhbGwgMToxMDczNzQxNzYwIHJldHVybmVkIC05OTk5LCBi
dXQgaXQgc2hvdWxkIGhhdmUgcmV0dXJuZWQgLUVOT1NZUwo+Pj4g4oCmCj4+Pgo+Pj4gYW5kIHNv
IG9u4oCmIFRoZSB0ZXN0IGhhcwo+Pj4KPj4+IHwgI2RlZmluZSBNT0RJRklFRF9CWV9QVFJBQ0Ug
ICAgICAtOTk5OQo+Pj4KPj4+IGFuZCB0aGUgcHRyYWNlciBtb2RpZmllcyB0aGUgcmV0dXJuIGNv
ZGUuIEhvd2V2ZXIgbm90IGFsd2F5cy4gTm90IHN1cmUKPj4+IGlmIHRoaXMgd2FzIGluZGVlZCBh
IHBvaW50bGVzcyBleGVyY2lzZSBvciBub3QuCj4+Cj4+IEhybW0uIFRoYXQncyB3ZWlyZC4gTGV0
IG1lIGhhdmUgYSBsb29rLgo+Cj5TbyBJIGNsZWFybHkgZmFpbGVkIHRvIGRlY29kZSB0aGUgb3Zl
cmxvYWRpbmcgb2YgdGhlIC0xTCByZXR1cm4gdmFsdWUKPmNvcnJlY3RseSBhbmQgdGhlbiBmYWls
ZWQgdG8gcnVuIHRoZSBzdHVwaWQgdGVzdC4KPgo+VEJILCB0aGlzIHdob2xlIHRoaW5nIHdhcyBh
IGhvcnJpZCBhbmQgaW5jb25zaXN0ZW50IG1lc3MuCj4KPlRoZSBsb2dpYyBpbiB0aGUgb3JpZ2lu
YWwgY29kZSB3YXM6Cj4KPiAgICBXaGVuIHRoZSBlbnRyeSB3b3JrIGNvZGUgcmV0dXJuZWQgYW4g
aW52YWxpZCBzeXNjYWxsIG51bWJlciB0aGVuIHRoZQo+ICAgIHJldHVybiB2YWx1ZSBpbiByZWdz
LT5heCB3YXMgc2V0IHRvIC1FTk9TWVMsIGV4Y2VwdCB3aGVuIHRoZQo+ICAgIHJldHVybmVkIHN5
c2NhbGwgbnVtYmVyIHdhcyAtMS4gU3lzY2FsbCBudW1iZXIgIi0xIiBpbmRpY2F0ZWQgdGhhdAo+
ICAgIHRoZSBzeXNjYWxsIGhhcyB0byBiZSBhYm9ydGVkLgo+Cj4gICAgIHJlZ3MtPmF4ID0gLUVO
T1NZUzsKPiAgICAgc3lzY2FsbCA9IGVudGVyX3dvcmsocmVncywgc3lzY2FsbCk7Cj4gICAgIGlm
IChzeXNjYWxsX2luX3JhbmdlKHN5c2NhbGwpKQo+ICAgICAgICByZWdzLT5heCA9IGRvX3N5c2Nh
bGwoc3lzY2FsbCk7Cj4gICAgIGVsc2UgaWYgKHN5c2NhbGwgIT0gLTEpCj4gICAgICAgIHJlZ3Mt
PmF4ID0gLUVOT1NZUzsKPgo+U28gaWYgdGhlIHB0cmFjZSBjaGVjayBpbiBlbnRlcl93b3JrKCkg
b3Zlcndyb3RlIHJlZ3MtPmF4IGFuZCB0aGUKPnN5c2NhbGwgbnVtYmVyIChlaXRoZXIgYXMgc3Vw
cGxpZWQgYnkgdXNlciBzcGFjZSBvciByZXdyaXR0ZW4pIHdhcyBvdXQKPm9mIHJhbmdlIGFuZCBu
b3QgLTEgdGhlbiB0aGUgeDg2IGVudHJ5IGNvZGUgb3Zlcndyb3RlIHJlZ3MtPmF4IHRvCj4tRU5P
U1lTIGFnYWluLiBJT1csIHRoZXJlIGlzIG5vIGRpc3RpbmN0aW9uIGJldHdlZW4gYSBjaGVjayBp
bmR1Y2VkCj5hYm9ydCBhbmQgYSBzeXNjYWxsIHdpdGggc3lzY2FsbCBudW1iZXIgLTEuCj4KPlRo
ZSByZXdvcmsgY2hhbmdlZCB0aGUgcmV0dXJuIHZhbHVlIHRvIGJvb2xlYW4sIHdoaWNoIGlzIHRy
dWUgd2hlbiB0aGUKPnN5c2NhbGwgc2hvdWxkIGJlIGludm9rZWQgYW5kIGZhbHNlIHdoZW4gb25l
IG9mIHRoZSBjaGVja3MgcmVxdWVzdHMgdG8KPmFib3J0IHRoZSBzeXNjYWxsLiBJbiB0aGF0IGNh
c2UgdGhlIHJldHVybiBjb2RlIGRvZXMgbm90IHRvdWNoIHRoZQo+cmV0dXJuIHZhbHVlIGluIHJl
Z3MtPmF4Lgo+Cj5JZiB0aGUgZXZlbnR1YWxseSBtb2RpZmllZCBzeXNjYWxsIG51bWJlciBpcyBv
dXQgb2YgcmFuZ2UgdGhlbiB0aGUgY29kZQo+cmVsaWVzIG9uIHRoZSBmYWN0IHRoYXQgcmVncy0+
YXggd2FzIHByZXNldCB3aXRoIC1FTk9TWVMsIGkuZS46Cj4KPiAgICAgcmVncy0+YXggPSAtRU5P
U1lTOwo+ICAgICAvLyBUcnVlIGluZGljYXRlcyB0byBwcm9jZWVkCj4gICAgIGlmIChlbnRlcl93
b3JrKHJlZ3MsICZzeXNjYWxsKSkgewo+ICAgICAgICAgaWYgKHN5c2NhbGxfaW5fcmFuZ2Uoc3lz
Y2FsbCkpCj4gICAgICAgICAgICByZWdzLT5heCA9IGRvX3N5c2NhbGwoc3lzY2FsbCk7Cj4gICAg
IH0KPgo+VGhhdCBzZWVtcyB0byBiZSBlcXVpdmFsZW50LCBidXQgaXQgaXMgbm90IHdoZW4gcHRy
YWNlKCkgbW9kaWZpZXMKPnRoZSByZXR1cm4gdmFsdWUgaW4gcmVncy0+YXggYW5kIGFsc28gcmV3
cml0ZXMgdGhlIHN5c2NhbGwgbnVtYmVyIHRvIGFuCj5pbnZhbGlkIHZhbHVlIG9yIGxlYXZlcyB0
aGUgdXNlciBzdXBwbGllZCBpbnZhbGlkIHZhbHVlIGludGFjdCBhbmQgZG9lcwo+X05PVF8gYWJv
cnQgdGhlIHN5c2NhbGwuCj4KPlNvIHRoZSByZXdvcmtlZCBjb2RlIGRvZXMgbm90IG92ZXJ3cml0
ZSB0aGUgdHJhY2VyIG1vZGlmaWVkIHJldHVybiB2YWx1ZQo+d2l0aCAtRU5PU1lTIGluIHRoYXQg
Y2FzZSBhbmQgcmV0dXJucyB3aGF0ZXZlciB0aGUgdHJhY2VyIGRlY2lkZWQgdG8gcHV0Cj5pbnRv
IGl0Lgo+Cj5UQkgsIHRoYXQgbWFrZXMgYSBsb3QgbW9yZSBzZW5zZSB0aGFuIHRoZSBvcmlnaW5h
bCBiZWhhdmlvci4gSWYgdGhlCj50cmFjZXIgZGVjaWRlcyB0byBmaWRkbGUgd2l0aCB0aGUgZGVm
YXVsdCByZXR1cm4gdmFsdWUgdGhlbiB0aGF0J3Mgd2hhdAo+dGhlIHRyYWNlciBpbnRlbmRlZC4K
Pgo+VGhhdCBtYWtlcyB0aGUgYmVoYXZpb3IgY29uc2lzdGVudCB2cy4gb3RoZXIgYWJvcnQgc2Nl
bmFyaW9zOgo+Cj4gICAgcHRyYWNlKCkKPiAgICAgIHJlZ3MtPmF4ID0gTUFHSUM7Cj4gICAgICBy
ZXR1cm4gdHJ1ZTsgICAgICAgICAgICAvLyBBbGxvdyBzeXNjYWxsCj4KPiAgICBzZWNjb21wKCkK
PiAgICAgIHJldHVybiBmYWxzZTsgICAgICAgICAgLy8gQWJvcnQgc3lzY2FsbAo+Cj5TbyB3aGVu
IHRoZSB0cmFjZXIgbW9kaWZpZWQgdGhlIHJldHVybiB2YWx1ZSBhbmQgc2VjY29tcCBhYm9ydHMg
dGhlCj5zeXNjYWxsIHRoZW4gdGhlIHRyYWNlciBpbmR1Y2VkIHZhbHVlIGlzIHByZXNlcnZlZC4g
VGhhdCB3YXMgdGhlIGNhc2UgaW4KPnRoZSBvcmlnaW5hbCBjb2RlIGFzIHdlbGwgYmVjYXVzZSBz
ZWNjb21wKCkgaW5kaWNhdGVkIHRoZSBhYm9ydCBieQo+cmV0dXJuaW5nIC0xIGFzIHRoZSBtb2Rp
ZmllZCBzeXNjYWxsIG51bWJlci4gU2ltaWxhciBlZmZlY3RzIHdoZW4gZnRyYWNlCj4oQlBGLCBr
cHJvYmUpIGRlY2lkZWQgdG8gb3ZlcndyaXRlIHRoZSBzeXNjYWxsIG51bWJlcikuCj4KPkJyaW5n
aW5nIHRoZSBvcmlnaW5hbCBiZWhhdmlvdXIgYmFjayBpcyB0cml2aWFsIGVub3VnaCwgYnV0IEkn
bSBub3QKPmNvbnZpbmNlZCB0aGF0IGl0IG1ha2VzIGFueSBzZW5zZSBhbmQgaXMgd29ydGggaXQu
IEF0IGxlYXN0IHRoaXMKPmNvbmZpbmVzIHRoZSB4MzIgc3BlY2lmaWMgaW5zYW5pdHkgb2YgdHJl
YXRpbmcgLTEgc3BlY2lhbCB0byB4MzIuLi4KPgo+VGhhbmtzLAo+Cj4gICAgICAgIHRnbHgKPi0t
LQo+LS0tIGEvYXJjaC94ODYvZW50cnkvc3lzY2FsbF8zMi5jCj4rKysgYi9hcmNoL3g4Ni9lbnRy
eS9zeXNjYWxsXzMyLmMKPkBAIC03Nyw2ICs3Nyw4IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUg
dm9pZCBkb19zeXNjYWxsXzMKPiAJaWYgKGxpa2VseShuciA8IElBMzJfTlJfc3lzY2FsbHMpKSB7
Cj4gCQluciA9IGFycmF5X2luZGV4X25vc3BlYyhuciwgSUEzMl9OUl9zeXNjYWxscyk7Cj4gCQly
ZWdzLT5heCA9IGlhMzJfc3lzX2NhbGwocmVncywgKHVuc2lnbmVkIGludClucik7Cj4rCX0gZWxz
ZSB7Cj4rCQlyZWdzLT5heCA9IC1FTk9TWVM7Cj4gCX0KPiB9Cj4gCj4tLS0gYS9hcmNoL3g4Ni9l
bnRyeS9zeXNjYWxsXzY0LmMKPisrKyBiL2FyY2gveDg2L2VudHJ5L3N5c2NhbGxfNjQuYwo+QEAg
LTY0LDE1ICs2NCwyNCBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wgZG9fc3lzY2FsbF94
Cj4gCXJldHVybiBmYWxzZTsKPiB9Cj4gCj4tc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIGRv
X3N5c2NhbGxfeDMyKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25lZCBsb25nIG5yKQo+K3N0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBkb19zeXNjYWxsX3gzMihzdHJ1Y3QgcHRfcmVncyAq
cmVncywgdW5zaWduZWQgbG9uZyBucikKPiB7Cj4rCWlmICghSVNfRU5BQkxFRChDT05GSUdfWDg2
X1gzMl9BQkkpKQo+KwkJcmV0dXJuIGZhbHNlOwo+Kwo+KwkvKiBQcmVzZXJ2ZSB0aGUgaGlzdG9y
aWMgaW5zYW5pdHkgb2YgdHJlYXRpbmcgLTEgc3BlY2lhbCBvbiB4MzIgKi8KPisJaWYgKG5yID09
IFVMT05HX01BWCkKPisJCXJldHVybiB0cnVlOwo+Kwo+IAkvKiBBZGp1c3QgdGhlIHN0YXJ0aW5n
IG9mZnNldCBvZiB0aGUgdGFibGUgKi8KPiAJbnIgLT0gX19YMzJfU1lTQ0FMTF9CSVQ7Cj4gCj4t
CWlmIChJU19FTkFCTEVEKENPTkZJR19YODZfWDMyX0FCSSkgJiYgbGlrZWx5KG5yIDwgWDMyX05S
X3N5c2NhbGxzKSkgewo+KwlpZiAobGlrZWx5KG5yIDwgWDMyX05SX3N5c2NhbGxzKSkgewo+IAkJ
bnIgPSBhcnJheV9pbmRleF9ub3NwZWMobnIsIFgzMl9OUl9zeXNjYWxscyk7Cj4gCQlyZWdzLT5h
eCA9IHgzMl9zeXNfY2FsbChyZWdzLCAodW5zaWduZWQgaW50KW5yKTsKPisJCXJldHVybiB0cnVl
Owo+IAl9Cj4rCXJldHVybiBmYWxzZTsKPiB9Cj4gCj4gLyogUmV0dXJucyB0cnVlIHRvIHJldHVy
biB1c2luZyBTWVNSRVQsIG9yIGZhbHNlIHRvIHVzZSBJUkVUICovCj5AQCAtODEsOCArOTAsMTAg
QEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIGRvX3N5c2NhbGxfeAo+IAlpZiAobGlrZWx5
KHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGVfcmFuZG9taXplX3N0YWNrKHJlZ3MsICZucikp
KSB7Cj4gCQlpbnN0cnVtZW50YXRpb25fYmVnaW4oKTsKPiAKPi0JCWlmICghZG9fc3lzY2FsbF94
NjQocmVncywgbnIpKQo+LQkJCWRvX3N5c2NhbGxfeDMyKHJlZ3MsIG5yKTsKPisJCWlmICh1bmxp
a2VseSghZG9fc3lzY2FsbF94NjQocmVncywgbnIpKSkgewo+KwkJCWlmICghZG9fc3lzY2FsbF94
MzIocmVncywgbnIpKQo+KwkJCQlyZWdzLT5heCA9IC1FTk9TWVM7Cj4rCQl9Cj4gCj4gCQlpbnN0
cnVtZW50YXRpb25fZW5kKCk7Cj4gCX0KPgo+Cj4KPgo+Cj4KPgo+Cj4KPgo+CgpJdCB3YXMgbmV2
ZXIgbGltaXRlZCB0byB4MzIuLi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtc25wcy1hcmMK
