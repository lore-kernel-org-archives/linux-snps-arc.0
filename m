Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99061C6FA8E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Mar 2023 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHyQvtwUeOps18uyNGkC1CFOl1k+dtYihGbGEgddMZk=; b=21Z0Cb41ATdKAa
	U6uEdM53rlax2eE5qzvMKPSZK/rYDfrmK2YUxrkdWIabRhjRyrxetnnIRLG0tWTJqURfz9O6cGAHv
	lsUllzP6My+MKeZnnO6+8QcAdPk0iftPge8VRKzN885GwAj10ZV2/zwmp2iSRvYM5io3no53ovkdE
	M+qnbUxqew5Eh5qYX3IISILC8PEejHAYrYADj8nDMbGJ1v9/3yGVI47hKpC+15YNdFPIZxSegE97n
	g+3ocKnW7rSdAlYnoWRppodx4F/VSC8w0FSivUgVpcMIXkp2XBeKyTlpIgDDmFtE5JffB6hui6Ipy
	KmasOFNO4g9xtiHGnGtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfsm-001cj0-3y; Thu, 02 Mar 2023 10:09:52 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfsg-001cgo-BQ; Thu, 02 Mar 2023 10:09:48 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 0EC1E60002;
	Thu,  2 Mar 2023 10:09:27 +0000 (UTC)
Message-ID: <c0dd1a6e-8e8e-5cdb-bc92-755462704edf@ghiti.fr>
Date: Thu, 2 Mar 2023 11:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 00/24] Remove COMMAND_LINE_SIZE from uapi
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S . Miller" <davem@davemloft.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
 <CAMuHMdVC99kFpS9vL+HEqbXdDRMKVSW_t21X1p37d0oQufxKLw@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAMuHMdVC99kFpS9vL+HEqbXdDRMKVSW_t21X1p37d0oQufxKLw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_020946_700614_C8BBC3CB 
X-CRM114-Status: GOOD (  28.72  )
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

SGkgR2VlcnQsCgpPbiAzLzIvMjMgMTA6NDcsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiBI
aSBBbGV4LAo+Cj4gT24gVGh1LCBNYXIgMiwgMjAyMyBhdCAxMDozNeKAr0FNIEFsZXhhbmRyZSBH
aGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+IFRoaXMgYWxsIGNhbWUgdXAg
aW4gdGhlIGNvbnRleHQgb2YgaW5jcmVhc2luZyBDT01NQU5EX0xJTkVfU0laRSBpbiB0aGUKPj4g
UklTQy1WIHBvcnQuICBJbiB0aGVvcnkgdGhhdCdzIGEgVUFCSSBicmVhaywgYXMgQ09NTUFORF9M
SU5FX1NJWkUgaXMgdGhlCj4+IG1heGltdW0gbGVuZ3RoIG9mIC9wcm9jL2NtZGxpbmUgYW5kIHVz
ZXJzcGFjZSBjb3VsZCBzdGF0aWNseSByZWx5IG9uCj4+IHRoYXQgdG8gYmUgY29ycmVjdC4KPj4K
Pj4gVXN1YWxseSBJIHdvdWxkbid0IG1lc3MgYXJvdW5kIHdpdGggY2hhbmdpbmcgdGhpcyBzb3J0
IG9mIHRoaW5nLCBidXQKPj4gUG93ZXJQQyBpbmNyZWFzZWQgaXQgd2l0aCBhNTk4MGQwNjRmZTIg
KCJwb3dlcnBjOiBCdW1wIENPTU1BTkRfTElORV9TSVpFCj4+IHRvIDIwNDgiKS4gIFRoZXJlIGFy
ZSBhbHNvIGEgaGFuZGZ1bCBvZiBleGFtcGxlcyBvZiBDT01NQU5EX0xJTkVfU0laRQo+PiBpbmNy
ZWFzaW5nLCBidXQgdGhleSdyZSBmcm9tIGJlZm9yZSB0aGUgVUFQSSBzcGxpdCBzbyBJJ20gbm90
IHF1aXRlIHN1cmUKPj4gd2hhdCB0aGF0IG1lYW5zOiBlNWE2YTFjOTA5NDggKCJwb3dlcnBjOiBk
ZXJpdmUgQ09NTUFORF9MSU5FX1NJWkUgZnJvbQo+PiBhc20tZ2VuZXJpYyIpLCA2ODRkMmZkNDhl
NzEgKCJbUzM5MF0ga2VybmVsOiBBcHBlbmQgc2NwZGF0YSB0byBrZXJuZWwKPj4gYm9vdCBjb21t
YW5kIGxpbmUiKSwgMjIyNDI2ODFjZmY1ICgiTUlQUzogRXh0ZW5kIENPTU1BTkRfTElORV9TSVpF
IiksCj4+IGFuZCAyYjc0Yjg1NjkzYzcgKCJzaDogRGVyaXZlIENPTU1BTkRfTElORV9TSVpFIGZy
b20KPj4gYXNtLWdlbmVyaWMvc2V0dXAuaC4iKS4KPj4KPj4gSXQgc2VlbXMgdG8gbWUgbGlrZSBD
T01NQU5EX0xJTkVfU0laRSByZWFsbHkganVzdCBzaG91bGRuJ3QgaGF2ZSBiZWVuCj4+IHBhcnQg
b2YgdGhlIHVhcGkgdG8gYmVnaW4gd2l0aCwgYW5kIHVzZXJzcGFjZSBzaG91bGQgYmUgYWJsZSB0
byBoYW5kbGUKPj4gL3Byb2MvY21kbGluZSBvZiB3aGF0ZXZlciBsZW5ndGggaXQgdHVybnMgb3V0
IHRvIGJlLiAgSSBkb24ndCBzZWUgYW55Cj4+IHJlZmVyZW5jZXMgdG8gQ09NTUFORF9MSU5FX1NJ
WkUgYW55d2hlcmUgYnV0IExpbnV4IHZpYSBhIHF1aWNrIEdvb2dsZQo+PiBzZWFyY2gsIGJ1dCB0
aGF0J3Mgbm90IHJlYWxseSBlbm91Z2ggdG8gY29uc2lkZXIgaXQgdW51c2VkIG9uIG15IGVuZC4K
Pj4KPj4gVGhpcyBpc3N1ZSB3YXMgYWxyZWFkeSBjb25zaWRlcmVkIGluIHMzOTAgYW5kIHRoZXkg
cmVhY2hlZCB0aGUgc2FtZQo+PiBjb25jbHVzaW9uIGluIGNvbW1pdCA2MjIwMjFjZDZjNTYgKCJz
MzkwOiBtYWtlIGNvbW1hbmQgbGluZQo+PiBjb25maWd1cmFibGUiKS4KPj4KPj4gVGhlIGZlZWRi
YWNrIG9uIHRoZSB2MSBzZWVtZWQgdG8gaW5kaWNhdGUgdGhhdCBDT01NQU5EX0xJTkVfU0laRSBy
ZWFsbHkKPj4gc2hvdWxkbid0IGJlIHBhcnQgb2YgdWFwaSwgc28gdGhpcyBub3cgdG91Y2hlcyBh
bGwgdGhlIHBvcnRzLiAgSSd2ZQo+PiB0cmllZCB0byBzcGxpdCB0aGlzIGFsbCBvdXQgYW5kIGxl
YXZlIGl0IGJpc2VjdGFibGUsIGJ1dCBJIGhhdmVuJ3QKPj4gdGVzdGVkIGl0IGFsbCB0aGF0IGFn
Z3Jlc3NpdmVseS4KPj4KPj4gQ2hhbmdlcyBzaW5jZSB2MyA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjMwMjE0MDc0OTI1LjIyODEwNi0xLWFsZXhnaGl0aUByaXZvc2luYy5jb20vPjoK
Pj4gKiBBZGRlZCBSQi9BQgo+PiAqIEFkZGVkIGEgbWVudGlvbiB0byBjb21taXQgNjIyMDIxY2Q2
YzU2ICgiczM5MDogbWFrZSBjb21tYW5kIGxpbmUKPj4gICAgY29uZmlndXJhYmxlIikgaW4gdGhl
IGNvdmVyIGxldHRlcgo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSEKPgo+ICAgQXBwYXJlbnRseSB5
b3UgZm9yZ290IHRvIGFkZCB5b3VyIG93biBTb0I/CgoKSSBkbyBub3Qga25vdywgc2hvdWxkIEk/
IFBhbG1lciBkaWQgYWxsIHRoZSB3b3JrLCBJIG9ubHkgZml4ZWQgMyBtaW5vciAKdGhpbmdzCgoK
Pgo+IEdye29ldGplLGVldGluZ31zLAo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0
Cj4KPiAtLQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKPgo+IEluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQK
PiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtc25wcy1hcmMK
