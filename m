Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F43C001B0
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Aug 2023 16:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/dX0l5Qrzq6SBKlo6PiV8t/JtF3sSbNguCv6DN6CleY=; b=ciwWP9PNI5Akc3
	4mSz8ws2Hx5AUBKZfkOf4O/U8RCar5LTmn6WUYqlwjijeOl5qoMabLtTiV8+ArzyL/3KXxR2XJHXj
	9J1788drve54B9WqTfEmj/d/rHSc21NytwTj30T+9QjAU99NugZwPwH9FGGzhxEIKslPUISmxMlGh
	Jjt8Gc2+VKf02i5EptT3XcZVWW7UzzOjrBfOlm64z6t2jsBnzBjvrxE89md+JkAl2NaKrF+0W2po3
	2SYbryulSiXgEBX52oaOj9c/5znSlMd0ne+peEYKivBgP9E3onpeSVcXepBs9So11p5B88UnoV+dq
	SBARaBjg4x4eDt9RIPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU86q-0087Ir-2e;
	Thu, 10 Aug 2023 16:02:00 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU86n-0087GG-1I;
	Thu, 10 Aug 2023 16:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1691683191; x=1692287991; i=deller@gmx.de;
 bh=LQ4BoluAVRb0GVjdydcgr6ii6FNpLvdjAbxqzo3k3IM=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=fVyd7cVX1xb7CULER8aXpZvUDMw34y68dpKhVUs8ZfR2S7048G7MucmX1i5TtqM6R82OMyR
 niOqfo7h9BzQcPM3ryfm4NQYVXaNPXZHHZkiz7VG1FgbUmccZMoRt7G6UJwhoSGn9oi7Ymmkv
 mbj2WMqZTUX9rlYnlvHU6nNlZgb9Rb3yDmafWzLCiiIfUD6X0LAiHIhVG31IXm6sBgI1OqjmK
 ggOkUGW0Ahf2P2Vq0c7++Ovnd8I4T4yVWat9f6Ob6QU9EnQto3j4L2pbtZS4yO+l3QwzXikWF
 s+FIdJZUUAJ1K0MR63xP+VnjXnNb/hlVTtQXE1xcoRa9FftNvh3g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.144.133]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0G1d-1pYKx73M6Z-00xKyR; Thu, 10
 Aug 2023 17:59:51 +0200
Message-ID: <5bc9d25c-d546-fe94-05cc-41bd5bbbaf67@gmx.de>
Date: Thu, 10 Aug 2023 17:59:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 16/17] [RFC] arch: turn -Wmissing-prototypes off
 conditionally
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Arnd Bergmann <arnd@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 guoren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stafford Horne <shorne@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "x86@kernel.org" <x86@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-next <linux-next@vger.kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S . Miller" <davem@davemloft.net>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Christian Brauner <brauner@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Youling Tang <tangyouling@loongson.cn>, Tiezhu Yang
 <yangtiezhu@loongson.cn>, Masahiro Yamada <masahiroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>,
 Xin Li <xin3.li@intel.com>, Nhat Pham <nphamcs@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Marc_Aur=c3=a8le_La_France?= <tsi@tuyoix.net>,
 Johannes Weiner <hannes@cmpxchg.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20230810141947.1236730-1-arnd@kernel.org>
 <20230810141947.1236730-17-arnd@kernel.org>
 <e0c2f7b1-b137-fbd3-aa28-808498eb8e3f@csgroup.eu>
 <a6222c7f-f903-4de5-821a-f90da8ad1dc9@app.fastmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <a6222c7f-f903-4de5-821a-f90da8ad1dc9@app.fastmail.com>
X-Provags-ID: V03:K1:7HICyZOHq9VZP2o9P4LYzDAEWALrWz4P+1I0orqIFFR4BJcuaIu
 Q9221KyRKsTxR9to62XBnXDSgCoxyl6ySZtyR6gJf0IRGNrYlEdlqawThuBvMmTa5OSZ9Wv
 Rh/jmDhXDhUPMZDeYgjoQxOJ9Pw3WKaPEG2OnD/UEDnyf+1A7038CdiHZdVsuvxWMe88oPX
 y9efA24egD5Bij0A0F5LQ==
UI-OutboundReport: notjunk:1;M01:P0:eTaYGH3ty9Q=;NJpZWDM1a6CIkGPR1WvHAlD80vR
 5vHeHYDZ4lcEJAN5tJc40ufY8F04Tox86qmnBiLu7NyOKWI9pEfJwc3zTOVyDI3m6coThGgDH
 5XgPXrhPWlhYlgKmhmMxJbomiJdr+fnochKzMwKSQC0RXV4bCsFVds5PekEWxiGIBWm5WYODS
 Yhz7ke5z5y7SGALHeuwBfCwRaYxu3EFT6v6C732qPG3t86/AtfuutwpSHExh6Mg1ziOWe0a4w
 Ry70jCe2TxeyhAIFoMwePvviXFv1h2UQ4nEvquIUEIPDMZJlRJTVAiO6w3dMEZ05EQmqhkvt1
 Cc2JcxcVR0y6v9zqx8MDRFic69ax8/apf/3WN5OB67zQGZSkXKvZF5aiJb1kWNtPeJ/+aP1fQ
 iYFe+uYvO9D91lTjb3i2pw4qi8D2k6EkNCVZH3SA1J2Hmc7Rsp5lbEYKTaslfp7+t9YEGZgwv
 YiVdd2e5N1bjBXPYAstCGy8Wx5T8V+EJyw/n2kN6uwmpqp1I5a3Co4iOTBxGmU2HxLeIhtTef
 TbQtC2xJp7M0n1KF/Y+IExPOfO29DmaPeZW0SUkvxYSjwdtJP3AB/2FdxP3TZcXVh9cIR8GXb
 6dU95L0uwddFDOeELmZR/3QU9B9klo8LR4CswW0tgFsGiwyKkdIt5zJHA3eAmcmR0hL5V36KT
 OwH28+t1FDtXL9GqJEDsyVb+1/29SJQBWKoxvs1iDOgz9LUEIa9oPaCgAStAOz4PYsv9AN/zE
 4nMJh/omWirBC7u9FzrLzPDAx+xdBDlPXa4+u3CNUfOyUAga8UkDROEHAVcxw0qxaMBSr+q38
 de3c7RYRK5BkKQOpSkY4kqm6eTu4J5qEUUna0vNhhbhonbvpnaFKKCpZ14hbAkMElxWUqTarO
 pspFwS9Qqepmle7qAbIpI35z8dyc9/0egJiK3eaMrUQxOBm8zx1UCjQo5A1m+A8XtHLzb568w
 JWFh3yEJ7/U3t85+niZsy+VmQpo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_090157_877492_6D274D8F 
X-CRM114-Status: GOOD (  29.61  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gOC8xMC8yMyAxNzoyMSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBPbiBUaHUsIEF1ZyAxMCwg
MjAyMywgYXQgMTY6NTksIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+IExlIDEwLzA4LzIwMjMg
w6AgMTY6MTksIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoKPj4+IEZyb206IEFybmQgQmVyZ21h
bm4gPGFybmRAYXJuZGIuZGU+Cj4+Pgo+Pj4gSSBoYXZlIGNsZWFuZWQgdXAgdGhlIC1XbWlzc2lu
Zy1wcm90b3R5cGVzIHdhcm5pbmdzIGZvciBtb3N0IG9mIHRoZSBtYWpvciBhcmNoaXRlY3R1cmVz
Cj4+PiBhcyB3ZWxsIGFzIGFsbCBkcml2ZXJzIHRoYXQgZ2V0IGVuYWJsZWQgZm9yIENPTkZJR19D
T01QSUxFX1RFU1QsIHNvIG5vdyB0aGVzZSBzaG91bGQgYmUKPj4+IGNsb3NlIHRvIGZpeGVkIG9u
IHg4NiwgYXJtLCBhcm02NCwgcG93ZXJwYywgczM5MCwgYW5kIHJpc2N2Lgo+Pj4KPj4+IFRoZSBv
dGhlciBhcmNoaXRlY3R1cmVzIHRlbmQgdG8gaGF2ZSBhIGxvdCBvZiB0aGVzZSB3YXJuaW5nIGlu
IGFyY2hpdGVjdHVyZSBzcGVjaWZpYwo+Pj4gY29kZSwgcHJpbWFyaWx5IGZyb20gZnVuY3Rpb25z
IHRoYXQgYXJlIG9ubHkgY2FsbGVkIGZyb20gYXNzZW1ibGVyIGNvZGUgYW5kIGRvCj4+PiBub3Qg
b3RoZXJ3aXNlIG5lZWQgYSBkZWNsYXJhdGlvbiBidXQgc3RpbGwgY2F1c2UgYSB3YXJuaW5nIHdp
dGhvdXQgb25lLiBPdGhlciBjYXNlcwo+Pj4gYXJlIHNpbXBseSBmdW5jdGlvbnMgdGhhdCBzaG91
bGQganVzdCBiZSBzdGF0aWMgb3IgYXJlIG1pc3NpbmcgYW4gI2luY2x1ZGUgc3RhdGVtZW50Lgo+
Pj4KPj4+IEluIG9yZGVyIHRvIGJlIGFibGUgdG8gdHVybiB0aGUgd2FybmluZyBvbiBnbG9iYWxs
eSBieSBkZWZhdWx0IHdpdGhvdXQgYnJlYWtpbmcgYWxsCj4+PiB0aGVzZSBhcmNoaXRlY3R1cmVz
LCBhZGQgYSBsaXN0IG9mIGV4Y2VwdGlvbnMgZm9yIGFyY2hpdGVjdHVyZSBkaXJlY3RvcmllcyB0
aGF0Cj4+PiBjYW4gcmV2ZXJ0IGJhY2sgdG8gdGhlIG9sZCBiZWhhdmlvciBvZiBub3Qgd2Fybmlu
ZyBiYXNlZCBvbiBhIG5ldwo+Pj4gQ09ORklHX1dOT19NSVNTSU5HX1BST1RPVFlQRVMgb3B0aW9u
Lgo+Pgo+PiBTb21lIGFyY2hpdGVjdHVyZXMgb25seSBoYXZlIGEgZmV3IG9mIHRob3NlIGVycm9y
cy93YXJuaW5ncy4KPj4KPj4gRm9yIGluc3RhbmNlIG1pY3JvYmxhemUgYW5kIHBhcmlzYyBvbmx5
IGhhdmUgb25lIGVhY2guIElzbid0IGl0IGJldHRlcgo+PiB0byBmaXggdGhlbSByYXRoZXIgdGhl
biB0dXJuIHRoZSBlcnJvcnMgb2ZmID8KPgo+IFRoZSBsaXN0IHdhcyBvbmx5IHRoZSAnZGVmY29u
ZmlnJyB3YXJuaW5ncywgdGhlcmUgYXJlIGEgY291cGxlIG1vcmUKPiB0aGF0IEkgc2F3IHdpdGgg
J2FsbG1vZGNvbmZpZycsIGFuZCBJJ20gc3VyZSB0aGVyZSBhcmUgZXZlbiBtb3JlCj4gd2hlbiBk
ZWFsaW5nIHdpdGggb3RoZXIgcmFuZG9tIGNvbmZpZ3VyYXRpb25zLgo+Cj4gSSBkaWQgc2VuZCBv
dGhlciBmaXhlcyBmb3IgbWljcm9ibGF6ZSBhbmQgcGFyaXNjIHNwZWNpZmljIGRyaXZlcnMsCj4g
YW5kIEkgY291bGQgYWxzbyBzZW5kIHBhdGNoZXMgZm9yIHRoZSB0d28gZGVmY29uZmlnIHdhcm5p
bmdzIGlmCj4gdGhlIG1haW50YWluZXJzIGFyZSBoYXBweSB3aXRoIGZpeGluZyB0aG9zZSBidXQg
bGVhdmluZyBhbGxtb2Rjb25maWcKPiB0byBzdGlsbCB3YXJuLCBidXQgSSBmZWVsIHRoYXQgaXQn
cyBlYXNpZXIgZm9yIHRoZW0gdG8ganVzdAo+IGRvIHRoZSBsYXN0IGZpeGVzIHRoZW1zZWx2ZXMg
YW5kIHRoZW4gcmVtb3ZlIG15IGhhY2sgYWdhaW4uCj4KPiBJJ2xsIHdhaXQgZm9yIE1pY2hhbCBh
bmQgSGVsZ2Ugb24gdGhlc2UuCgpBcm5kLCBJIGxpa2UgeW91ciBwYXRjaCEKRm9yIHBhcmlzYyBJ
J3ZlIGRvbmUgcXVpdGUgc29tZSB3b3JrIGR1cmluZyB0aGUgbGFzdCBmZXcgd2Vla3MgdG8KZ2V0
IHN1Y2ggd2FybmluZ3Mgc3FlZXplZCBvdXQsIHNvIHBsZWFzZSBkcm9wIHRoZSBodW5rIGZvciBw
YXJpc2MgZnJvbQp5b3VyIHBhdGNoLiBNeSBwbGFuIGlzIHRvIGJlY29tZSB3YXJuaW5nLWZyZWUg
YmVmb3JlIDYuNS1maW5hbC4KClRoaXMgbGFzdCBvbmU6CiAgICAgYXJjaC9wYXJpc2MvbGliL3Vj
bXBkaTIuYzoxMjo1OiBlcnJvcjogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciAnX191Y21wZGky
JyBbLVdlcnJvcj1taXNzaW5nLXByb3RvdHlwZXNdCkknbGwgdGFrZSBjYXJlIGluIHRoZSBwYXJp
c2MgZm9yLW5leHQgdHJlZS4KClRoYW5rcyEKSGVsZ2UKCj4+IE90aGVycyBsaWtlIGxvb25nYXJj
aCB3aGljaCBpcyBhIHJlY2VudCBhY3RpdmVseSBtYWludGFpbmVkCj4+IGFyY2hpdGVjdHVyZSwg
SSdkIGV4cGVjdCB0aGUgMzAgZXJyb3JzIHRvIGJlIGVhc3kgdG8gZml4Lgo+Cj4gQWdyZWVkLCB0
aGV5IHByb2JhYmx5IGFyZS4KPgo+PiBNYW55IG9mIHRoZSBhbHBoYSBvbmVzIHNlZW1zIHRvIGJl
IGJyb3VnaHQgYnkgeW91ciBjb21taXQgZTE5ZDRlYmM1MzZkCj4+ICgiYWxwaGE6IGFkZCBmdWxs
IGlvcmVhZDY0L2lvd3JpdGU2NCBpbXBsZW1lbnRhdGlvbiIpCj4KPiBBcyBmYXIgYXMgSSBjYW4g
c2VlLCB0aG9zZSBhbHJlYWR5IGV4aXN0aW5nIGJlZm9yZSB0aGF0IHBhdGNoLCB0aG91Z2gKPiBJ
IGRpZCB0b3VjaCB0aGUgc2FtZSBsaW5lcyB0aGVyZS4KPgo+IEluIHRoZSBlbmQgaXQncyBhIG1h
dHRlciBvZiB3aGVyZSB0byBzdG9wLCBhcyB0aGVyZSBhcmUgZW5kbGVzcwo+IGNvbmZpZ3VyYXRp
b25zIHRvIHRlc3QgaWYgSSB3YW50IHRvIGRvIGEgY29tcGxldGUgam9iLiBJIGRyZXcgdGhlCj4g
bGluZSBiZXR3ZWVuIHBvd2VycGMgKHdoaWNoIEkgdHJpZWQgdG8gZml4KSBhbmQgbWlwcyAod2hp
Y2ggSSBsZWZ0Cj4gYWxvbmUpLCBtYWlubHkgYmVjYXVzZSB0aGUgcG93ZXJwYyBzaWRlIHdhcyBh
bHJlYWR5IGV4aGF1c3RpbmcKPiBhbmQgbWlwcyBoYXMgZXZlbiBtb3JlIG9ic2N1cmUgY29uZmln
dXJhdGlvbnMuIFRoZSBvdGhlciBvbmVzIG9uCj4gdGhlIGxpc3QgYXJlIGFsbCBsZXNzIGFjdGl2
ZWx5IG1haW50YWluZWQgdGhhbiB0aGVzZSB0d28uCj4KPiAgICAgICBBcm5kCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFp
bGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
