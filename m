Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67365EE49A5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Sep 2024 13:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BN5pUHjzCepeROuiRDYfiEVEyB0HHrBmtTWkGiMprh4=; b=N995+7oIi9cO/q
	Po11UG05aJ/P80t8zU2a8Y0NBDAgcuuKG/C7dsv+FO/ukEB6ya81j/jCYACJ7VtwzgYaAugwk7aOZ
	Vn/VCnBeHFT6UJijiG+1WdwoAFaIT8tYL1ZkZjIhohTAm/IQY5itv8b+d3PWV0IZCStp5fMR1w54Y
	co1KoBNP7FM4euH8tqStmRzNKccI3EDwvmlis24xttU85iUlBRIx9KmZf1wcQ8gy5t7AFIPmYfJeY
	QVXy1RuXWm8gAvb0pm1OLLl1Rcp6lB8YuwGEvBBoEgF0UkvVmdHj5KNrelU65WvDboM5/SxY5qo1v
	iqH/1R1WFFrXRTHAlYKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soNZB-00000009jLY-0Fta;
	Wed, 11 Sep 2024 13:39:29 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soNYj-00000009j5s-13bo;
	Wed, 11 Sep 2024 13:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726061936;
	bh=/x6ppqNQQLzdvBUIltgwblDbEd/NsLYvkwyhRq8ySOg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oIPjnjA38dDfnNUU0Rs/abozRGK9t9kzNcCWqs5zkrEw2u4QwGt3vFSpn0kotBm8X
	 fivnKpkEy/q9VIrQ4TVvIWeyCWERZBfrVvamUQzRqxJXXE/ps5sAChCuugQudut2zk
	 DVgLI54TE1CBwlW9mpADteXyPpiwyWh5AMK6K8+zAbXoPZkgJcSleQSG3qGcaJyJXX
	 A5ciDIpzEWsP5XUlIHYqj38DukHhKGL3HyneCvdybHcxtCNddxIqe5i6i2FP5wwBY7
	 57TlSw4u4a4SBXs0AeeOR/Okf9JAYihkTJfD71w2XroNa0syJ2Nx+YmIr7sD2bhmLV
	 DphJhs7LqH5rg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3hVm0rPLz4x8Q;
	Wed, 11 Sep 2024 23:38:55 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta
 <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Guo Ren
 <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge
 Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao
 <naveen@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald
 Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich
 Felker <dalias@libc.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Michal Hocko <mhocko@suse.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>, Chris Torek
 <chris.torek@gmail.com>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
In-Reply-To: <CAMuHMdURgy6NPthHhfOv_h=C_gw2hEpnGQ7iBGoDE=ZazUPRHA@mail.gmail.com>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <87zfol468z.fsf@mail.lhotse> <Zt9HboH/PmPlRPmH@ghost>
 <1aca8e4c-1c12-4624-a689-147ff60b75d6@csgroup.eu>
 <CAMuHMdURgy6NPthHhfOv_h=C_gw2hEpnGQ7iBGoDE=ZazUPRHA@mail.gmail.com>
Date: Wed, 11 Sep 2024 23:38:55 +1000
Message-ID: <8734m6s428.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_063901_909169_28AF7241 
X-CRM114-Status: GOOD (  13.45  )
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

R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JpdGVzOgo+IEhpIENo
cmlzdG9waGUsCj4KPiBPbiBUdWUsIFNlcCAxMCwgMjAyNCBhdCAxMToyMeKAr0FNIENocmlzdG9w
aGUgTGVyb3kKPiA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToKPj4gPj4+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvcGVyc29uYWxpdHkuaCBiL2luY2x1ZGUvdWFw
aS9saW51eC9wZXJzb25hbGl0eS5oCj4+ID4+PiBpbmRleCA0OTc5NmI3NzU2YWYuLmNkM2I4YzE1
NGQ5YiAxMDA2NDQKPj4gPj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9wZXJzb25hbGl0eS5o
Cj4+ID4+PiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvcGVyc29uYWxpdHkuaAo+PiA+Pj4gQEAg
LTIyLDYgKzIyLDcgQEAgZW51bSB7Cj4+ID4+PiAgICAgV0hPTEVfU0VDT05EUyA9ICAgICAgICAg
MHgyMDAwMDAwLAo+PiA+Pj4gICAgIFNUSUNLWV9USU1FT1VUUyA9ICAgICAgIDB4NDAwMDAwMCwK
Pj4gPj4+ICAgICBBRERSX0xJTUlUXzNHQiA9ICAgICAgICAweDgwMDAwMDAsCj4+ID4+PiArICAg
QUREUl9MSU1JVF80N0JJVCA9ICAgICAgMHgxMDAwMDAwMCwKPj4gPj4+ICAgfTsKPj4gPj4KPj4g
Pj4gSSB3b25kZXIgaWYgQUREUl9MSU1JVF8xMjhUIHdvdWxkIGJlIGNsZWFyZXI/Cj4+ID4+Cj4+
ID4KPj4gPiBJIGRvbid0IGZvbGxvdywgd2hhdCBkb2VzIDEyOFQgcmVwcmVzZW50Pwo+Pgo+PiAx
MjhUIGlzIDEyOCBUZXJhYnl0ZXMsIHRoYXQncyB0aGUgbWF4aW11bSBzaXplIGFjaGlldmFibGUg
d2l0aCBhIDQ3QklUCj4+IGFkZHJlc3MsIHRoYXQgbmFtaW5nIHdvdWxkIGJlIG1vcmUgY29uc2lz
dGFudCB3aXRoIHRoZSBBRERSX0xJTUlUXzNHQgo+PiBqdXN0IGFib3ZlIHRoYXQgbWVhbnMgYSAz
IEdpZ2FieXRlcyBsaW1pdC4KPgo+IEhlbmNlIEFERFJfTElNSVRfMTI4VEI/CgpZZXMgaXQgc2hv
dWxkIGJlIDEyOFRCLiBUeXBvIGJ5IG1lLgoKY2hlZXJzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGlu
dXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
