Return-Path: <SRS0=NSlt=25=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE4AC00523
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jan 2020 08:36:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2237206F0
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jan 2020 08:36:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LEfseBnk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="fxUelGuu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2237206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m7yaVSufKvb+SksGhVrBw+4lv9kcCN3tUZFwvzEZzHc=; b=LEfseBnkx1rpjf5U3lK93Tr5t
	jFfcmaEH4uST/tV0g+xL0D8yP517xXZbRmqe1nLCEvH7NQH/pFLSn7SSWeRR4lVaETBtQgG4/x21A
	TV4e0iBgIIL7hgOg8aPB+VMrhVSLQdz/56zLcLWoqv/5zlAmnxtCDnaphPRwtFGOKLUr5X48Pg83M
	Uoj0B1wZv9ylyAz6u8e4pDMi/lktFJ31qZG1I6sELhlPGlqvwh30HJsQl7iZbKUDeLC1TIH01V/JR
	QsbcpeKKAKJGlTeCcY0/8wYOIOgF+Lb1Gzoj0N8XyNghn4IVEOAPJbEBYhcWssO0O0RjPzSzWnx+0
	dIuA4FK5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip6p4-0003RA-Pw; Wed, 08 Jan 2020 08:36:14 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip6p2-0003Q0-CE
 for linux-snps-arc@lists.infradead.org; Wed, 08 Jan 2020 08:36:14 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47t2dP2tfYz9v3gf;
 Wed,  8 Jan 2020 09:35:53 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=fxUelGuu; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id I0TjIRBHFA-4; Wed,  8 Jan 2020 09:35:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47t2dP1Xwtz9v3gS;
 Wed,  8 Jan 2020 09:35:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578472553; bh=pyCqgPPZ7kRofrDb80nScePrylWdxYR2l2/ULCClPrs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fxUelGuuZbXfGsWb57/3BxUjvtvdC/2QbyAEo6YqIvKJAL5rv4xC8YAPDeq7nhud3
 dkB/UdAQUigd1rFWPHMhgX/6Fa4jCdXgPI62S3zygNDeTcqR1ZOBKH62ej2i0cflHq
 zb2g6a/VdTBtVa3azjNLc7pwBVFpYUnXR94BgWzQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2FF4A8B7EC;
 Wed,  8 Jan 2020 09:35:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PkGUzhhRpTGx; Wed,  8 Jan 2020 09:35:54 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BE1C98B7EA;
 Wed,  8 Jan 2020 09:35:53 +0100 (CET)
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
 <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
 <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
Date: Wed, 8 Jan 2020 09:35:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_003612_716546_2D5374A4 
X-CRM114-Status: GOOD (  12.44  )
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Jon Mason <jdmason@kudzu.us>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Daniel Vetter <daniel@ffwll.ch>, alpha <linux-alpha@vger.kernel.org>,
 linux-ntb@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpMZSAwOC8wMS8yMDIwIMOgIDA5OjE4LCBLcnp5c3p0b2YgS296bG93c2tpIGEgw6ljcml0wqA6
Cj4gT24gV2VkLCA4IEphbiAyMDIwIGF0IDA5OjEzLCBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPj4KPj4gSGkgS3J6eXN6dG9mLAo+Pgo+PiBPbiBXZWQs
IEphbiA4LCAyMDIwIGF0IDk6MDcgQU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1t
NjhrLm9yZz4gd3JvdGU6Cj4+PiBPbiBUdWUsIEphbiA3LCAyMDIwIGF0IDU6NTMgUE0gS3J6eXN6
dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPj4+PiBUaGUgaW9yZWFkOC8x
Ni8zMigpIGFuZCBvdGhlcnMgaGF2ZSBpbmNvbnNpc3RlbnQgaW50ZXJmYWNlIGFtb25nIHRoZQo+
Pj4+IGFyY2hpdGVjdHVyZXM6IHNvbWUgdGFraW5nIGFkZHJlc3MgYXMgY29uc3QsIHNvbWUgbm90
Lgo+Pj4+Cj4+Pj4gSXQgc2VlbXMgdGhlcmUgaXMgbm90aGluZyByZWFsbHkgc3RvcHBpbmcgYWxs
IG9mIHRoZW0gdG8gdGFrZQo+Pj4+IHBvaW50ZXIgdG8gY29uc3QuCj4+Pgo+Pj4gU2hvdWxkbid0
IGFsbCBvZiB0aGVtIHRha2UgY29uc3Qgdm9sYXRpbGUgX19pb21lbSBwb2ludGVycz8KPj4+IEl0
IHNlZW1zIHRoZSAidm9sYXRpbGUiIGlzIG1pc3NpbmcgZnJvbSBhbGwgYnV0IHRoZSBpbXBsZW1l
bnRhdGlvbnMgaW4KPj4+IGluY2x1ZGUvYXNtLWdlbmVyaWMvaW8uaC4KPj4KPj4gQXMgbXkgInZv
bGF0aWxlIiBjb21tZW50IGFwcGxpZXMgdG8gaW93cml0ZSooKSwgdG9vLCBwcm9iYWJseSB0aGF0
IHNob3VsZCBiZQo+PiBkb25lIGluIGEgc2VwYXJhdGUgcGF0Y2guCj4+Cj4+IEhlbmNlIHdpdGgg
cGF0Y2hlcyAxLTUgc3F1YXNoZWQsIGFuZCBmb3IgcGF0Y2hlcyAxMS0xMzoKPj4gUmV2aWV3ZWQt
Ynk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4gCj4gSSds
bCBhZGQgdG8gdGhpcyBvbmUgYWxzbyBjaGFuZ2VzIHRvIGlvcmVhZFhfcmVwKCkgYW5kIGFkZCBh
bm90aGVyCj4gcGF0Y2ggZm9yIHZvbGF0aWxlIGZvciByZWFkcyBhbmQgd3JpdGVzLiBJIGd1ZXNz
IHlvdXIgcmV2aWV3IHdpbGwgYmUKPiBhcHByZWNpYXRlZCBvbmNlIG1vcmUgYmVjYXVzZSBvZiBp
b3JlYWRYX3JlcCgpCj4gCgp2b2xhdGlsZSBzaG91bGQgcmVhbGx5IG9ubHkgYmUgdXNlZCB3aGVy
ZSBkZWVtZWQgbmVjZXNzYXJ5OgoKaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRl
c3QvcHJvY2Vzcy92b2xhdGlsZS1jb25zaWRlcmVkLWhhcm1mdWwuaHRtbAoKSXQgaXMgc2FpZDog
IiAuLi4gIGFjY2Vzc29yIGZ1bmN0aW9ucyBtaWdodCB1c2Ugdm9sYXRpbGUgb24gCmFyY2hpdGVj
dHVyZXMgd2hlcmUgZGlyZWN0IEkvTyBtZW1vcnkgYWNjZXNzIGRvZXMgd29yay4gRXNzZW50aWFs
bHksIAplYWNoIGFjY2Vzc29yIGNhbGwgYmVjb21lcyBhIGxpdHRsZSBjcml0aWNhbCBzZWN0aW9u
IG9uIGl0cyBvd24gYW5kIAplbnN1cmVzIHRoYXQgdGhlIGFjY2VzcyBoYXBwZW5zIGFzIGV4cGVj
dGVkIGJ5IHRoZSBwcm9ncmFtbWVyLiIKCkNocmlzdG9waGUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdAps
aW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
