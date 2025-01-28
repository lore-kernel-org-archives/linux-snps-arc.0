Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4232DC0218A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jan 2025 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BeDNAJxzP28YdyKJKVgsurAP8BZTkQwoQ1iuG8ZOemc=; b=RoWdLg/Alk+8Fs
	CIS7bKKl3ltaHH3msLSf4eRhWVNHHbfHxnCKIerXPXA256wo4nEW9ilymN3h5U/gGPTM3ts+adWuZ
	GB/rxtduVD6iSDGGxHyXzsBgTmy4cb+KHgHh3xYA2+6Gff/4ORhsO1tTeMbfqcEwWV4VakPLkSGld
	hbdGTR7dqxgmUz6ZluxM/smfu8p+s0jxpWiA7h6xFtixlo1Djit00dVkw14ZAf+7vxskuOR58+8nU
	83sbDOElhG1D8c/4IvzKXNb80YlmQtrRhfhr3ctGTITl9D+ngh5KDkry6zR7/2VnYrCoD/II/+9zW
	TmWFpchRdjqrBAXGbcuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoVB-00000005KVU-3NTV;
	Tue, 28 Jan 2025 16:31:49 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoHU-00000005ILz-3DjB;
	Tue, 28 Jan 2025 16:17:42 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id CC0E572C90D;
	Tue, 28 Jan 2025 19:17:37 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id B9EE97CCB3A; Tue, 28 Jan 2025 18:17:37 +0200 (IST)
Date: Tue, 28 Jan 2025 18:17:37 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Oleg Nesterov <oleg@redhat.com>, linux-snps-arc@lists.infradead.org,
	Rich Felker <dalias@libc.org>, Thomas Gleixner <tglx@linutronix.de>,
	Andreas Larsson <andreas@gaisler.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
	WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	strace-devel@lists.strace.io, linux-arch@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mike Frysinger <vapier@gentoo.org>,
	Davide Berardi <berardi.dav@gmail.com>,
	Renzo Davoli <renzo@cs.unibo.it>, linux-um@lists.infradead.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Stafford Horne <shorne@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Richard Weinberger <richard@nod.at>,
	Johannes Berg <johannes@sipsolutions.net>,
	Alexey Gladkov <legion@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3 2/6] syscall.h: add syscall_set_arguments() and
 syscall_set_return_value()
Message-ID: <20250128161737.GD11869@strace.io>
References: <20250128091626.GB8601@strace.io>
 <df7441ae-e478-4a40-aaa7-461d9b589e06@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df7441ae-e478-4a40-aaa7-461d9b589e06@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_081741_019941_03D1DF1C 
X-CRM114-Status: GOOD (  11.96  )
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

T24gVHVlLCBKYW4gMjgsIDIwMjUgYXQgMDQ6MDQ6MzRQTSArMDEwMCwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToKPiBMZSAyOC8wMS8yMDI1IMOgIDEwOjE2LCBEbWl0cnkgVi4gTGV2aW4gYSDDqWNy
aXTCoDoKPiA+IFRoZXNlIGZ1bmN0aW9ucyBhcmUgZ29pbmcgdG8gYmUgbmVlZGVkIG9uIGFsbCBI
QVZFX0FSQ0hfVFJBQ0VIT09LCj4gPiBhcmNoaXRlY3R1cmVzIHRvIGltcGxlbWVudCBQVFJBQ0Vf
U0VUX1NZU0NBTExfSU5GTyBBUEkuCj4gCj4gVGhlIHN1YmplY3QgaXMgbWlzbGVhZGluZy4gc3lz
Y2FsbF9zZXRfcmV0dXJuX3ZhbHVlKCkgYWxyZWFkeSBleGlzdHMgb24gCj4gbW9zdCBhcmNoaXRl
Y3R1cmVzIGFuZCB3YXMgbm90IGFkZHJlc3NlZCBieSBjb21taXQgNzk2MmMyZWRkYmZlLgo+IAo+
IE1heWJlIGl0IHdvdWxkIGJlIGJldHRlciB0byBoYW5kbGUgc3lzY2FsbF9zZXRfcmV0dXJuX3Zh
bHVlKCkgaW4gYSAKPiBzZXBhcmF0ZSBjb21taXQuCgpzeXNjYWxsX3NldF9yZXR1cm5fdmFsdWUo
KSBpcyBiZWluZyBhZGRlZCBvbmx5IG9uIGhleGFnb24uCkkgZGlkbid0IHRoaW5rIGl0IHdvcnRo
IGEgc2VwYXJhdGUgY29tbWl0LCBidXQgaXQncyBjZXJ0YWlubHkgcG9zc2libGUKdG8gc3BsaXQg
dGhpcyBjb21taXQgaW50byB0d28uCgoKLS0gCmxkdgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4
LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
