Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD17C433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Mar 2022 10:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7akfkvl8n6Er8mI8MEEntxIQdjVy/cMZdgG4XCPC19g=; b=jbTuXV4HXmh6po
	scGrtTh2PRWOzTUYEjtbATBbZ/+sHAa/d4lNBkP5Niq695H13SVsWHJ04ffWSgo7K4GGUkRs6V7QF
	J71dHS5PwdmHDKRXAOYkNX4Exm81qSdoJoXUFzseAntycQmawxbHog+s172dmgY09Cmv8sRiL4uxJ
	H73pHUN+G1OdmRzjZ7Tjp+TDe31uOXKksbPvZWVT13PqnJJIQCJDZpP4DS96Jb6k2k5hDRzNar196
	9SOZhbdBsSz25Zjc4NPm+uKqmuDgNVt92KscBZ39WRCCFf6cbVEkqTGCvM2kN262P7BG8oi3gtJ62
	oFGtCbXyTCIXFEAmnYow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPLrj-002DhO-CM; Wed, 02 Mar 2022 10:05:51 +0000
Received: from mail-vs1-f44.google.com ([209.85.217.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPLrc-002Dd0-6D; Wed, 02 Mar 2022 10:05:45 +0000
Received: by mail-vs1-f44.google.com with SMTP id g21so1248776vsp.6;
 Wed, 02 Mar 2022 02:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EYfrVL/3Fk55o7PeesHa/rcefVwDuQvh3Zqyw9HxNck=;
 b=0JLcmI6otN0BTM7ERkZ4NSrI2gdc8ZpwnMobZ8gghFu+Y+Iw1yn1udEFlJ7TmsevZi
 MqIZqI6t8H0Do8HEESKGZmN+etFDv5pLPpzUuA31t+5xr74a2yXE0CqXLo60a/b0+cTa
 /txgJ12GIG0YsF6lDBgS+3PFiNyltb3v2UfHybiUZdL/K4LXWIsfmUDc0aB6VudQ5cBn
 LhkhwMzYdfSNO57R0hV/D+/NNxfLud8GmtW3QGPw7V9jev4JEtaE8T8miivVEGLcACgh
 YSS3rxwnapJyOx4GLiGliHbYFsrtgzqcf2rWVncqZgQcGetNdtY0TiC8qkqfeYjlS+O/
 SH+Q==
X-Gm-Message-State: AOAM531qPrFy008KIjzyMyl45cpNRQuG5T7LJFamWe5kch7KYwE5MpA+
 UZH1vp95rEU6n53tXDzkNKuoz/fBWqCiTg==
X-Google-Smtp-Source: ABdhPJxrkjWGo6P5HC/4KvN+lbVpOPfhVOOa/ny3dJdAxlv8rfqbkKXPPqFKtMqDi7+QNsp1z45eSw==
X-Received: by 2002:a67:ca0c:0:b0:31b:db46:4c83 with SMTP id
 z12-20020a67ca0c000000b0031bdb464c83mr12736178vsk.74.1646215541356; 
 Wed, 02 Mar 2022 02:05:41 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com.
 [209.85.217.54]) by smtp.gmail.com with ESMTPSA id
 w123-20020a1fdf81000000b003322033e617sm2926689vkg.36.2022.03.02.02.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 02:05:40 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id w4so1272825vsq.1;
 Wed, 02 Mar 2022 02:05:40 -0800 (PST)
X-Received: by 2002:a67:c499:0:b0:320:2cd8:9e1a with SMTP id
 d25-20020a67c499000000b003202cd89e1amr266158vsk.38.1646215539723; Wed, 02 Mar
 2022 02:05:39 -0800 (PST)
MIME-Version: 1.0
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
 <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
 <542fa048-131e-240b-cc3a-fd4fff7ce4ba@arm.com>
 <Yh1pYAOiskEQes3p@shell.armlinux.org.uk>
 <dc3c95a4-de06-9889-ce1e-f660fc9fbb95@csgroup.eu>
 <c3b60de0-38cd-160a-aa15-831349e07e23@arm.com>
 <52866c88-59f9-2d1c-6f5a-5afcaf23f2bb@csgroup.eu>
 <9caa90f5-c10d-75dd-b403-1388b7a3d296@arm.com>
In-Reply-To: <9caa90f5-c10d-75dd-b403-1388b7a3d296@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Mar 2022 11:05:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU11kaOzanhHZRH+mLTJzaz-i=PnKdK7NF9V-qx6kp8wg@mail.gmail.com>
Message-ID: <CAMuHMdU11kaOzanhHZRH+mLTJzaz-i=PnKdK7NF9V-qx6kp8wg@mail.gmail.com>
Subject: Re: [PATCH V3 09/30] arm/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Russell King (Oracle)" <linux@armlinux.org.uk>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, 
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, 
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, 
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, 
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, 
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, 
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, 
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_020544_266473_55579EC7 
X-CRM114-Status: GOOD (  49.04  )
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

SGkgQW5zaHVtYW4sCgpPbiBXZWQsIE1hciAyLCAyMDIyIGF0IDEwOjUxIEFNIEFuc2h1bWFuIEto
YW5kdWFsCjxhbnNodW1hbi5raGFuZHVhbEBhcm0uY29tPiB3cm90ZToKPiBPbiAzLzIvMjIgMTI6
MzUgUE0sIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4gPiBMZSAwMi8wMy8yMDIyIMOgIDA0OjIy
LCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdCA6Cj4gPj4gT24gMy8xLzIyIDE6NDYgUE0sIENo
cmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4gPj4+IExlIDAxLzAzLzIwMjIgw6AgMDE6MzEsIFJ1c3Nl
bGwgS2luZyAoT3JhY2xlKSBhIMOpY3JpdCA6Cj4gPj4+PiBPbiBUdWUsIE1hciAwMSwgMjAyMiBh
dCAwNTozMDo0MUFNICswNTMwLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPiA+Pj4+PiBPbiAy
LzI4LzIyIDQ6MjcgUE0sIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToKPiA+Pj4+Pj4gT24g
TW9uLCBGZWIgMjgsIDIwMjIgYXQgMDQ6MTc6MzJQTSArMDUzMCwgQW5zaHVtYW4gS2hhbmR1YWwg
d3JvdGU6Cj4gPj4+Pj4+PiBUaGlzIGRlZmluZXMgYW5kIGV4cG9ydHMgYSBwbGF0Zm9ybSBzcGVj
aWZpYyBjdXN0b20gdm1fZ2V0X3BhZ2VfcHJvdCgpIHZpYQo+ID4+Pj4+Pj4gc3Vic2NyaWJpbmcg
QVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVC4gU3Vic2VxdWVudGx5IGFsbCBfX1NYWFggYW5kIF9f
UFhYWAo+ID4+Pj4+Pj4gbWFjcm9zIGNhbiBiZSBkcm9wcGVkIHdoaWNoIGFyZSBubyBsb25nZXIg
bmVlZGVkLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBXaGF0IEkgd291bGQgcmVhbGx5IGxpa2UgdG8ga25v
dyBpcyB3aHkgaGF2aW5nIHRvIHJ1biBfY29kZV8gdG8gd29yayBvdXQKPiA+Pj4+Pj4gd2hhdCB0
aGUgcGFnZSBwcm90ZWN0aW9ucyBuZWVkIHRvIGJlIGlzIGJldHRlciB0aGFuIGxvb2tpbmcgaXQg
dXAgaW4gYQo+ID4+Pj4+PiB0YWJsZS4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gTm90IG9ubHkgaXMgdGhp
cyBtb3JlIGV4cGVuc2l2ZSBpbiB0ZXJtcyBvZiBDUFUgY3ljbGVzLCBpdCBhbHNvIGJyaW5ncwo+
ID4+Pj4+PiBhZGRpdGlvbmFsIGNvZGUgc2l6ZSB3aXRoIGl0Lgo+ID4+Pj4+Pgo+ID4+Pj4+PiBJ
J20gc3RydWdnbGluZyB0byBzZWUgd2hhdCB0aGUgYmVuZWZpdCBpcy4KPiA+Pj4+Pgo+ID4+Pj4+
IEN1cnJlbnRseSB2bV9nZXRfcGFnZV9wcm90KCkgaXMgYWxzbyBiZWluZyBfcnVuXyB0byBmZXRj
aCByZXF1aXJlZCBwYWdlCj4gPj4+Pj4gcHJvdGVjdGlvbiB2YWx1ZXMuIEFsdGhvdWdoIHRoYXQg
aXMgYmVpbmcgcnVuIGluIHRoZSBjb3JlIE1NIGFuZCBmcm9tIGEKPiA+Pj4+PiBwbGF0Zm9ybSBw
ZXJzcGVjdGl2ZSBfX1NYWFgsIF9fUFhYWCBhcmUganVzdCBiZWluZyBleHBvcnRlZCBmb3IgYSB0
YWJsZS4KPiA+Pj4+PiBMb29raW5nIGl0IHVwIGluIGEgdGFibGUgKGFuZCBhcHBseWluZyBtb3Jl
IGNvbnN0cnVjdHMgdGhlcmUgYWZ0ZXIpIGlzCj4gPj4+Pj4gbm90IG11Y2ggZGlmZmVyZW50IHRo
YW4gYSBjbGVhbiBzd2l0Y2ggY2FzZSBzdGF0ZW1lbnQgaW4gdGVybXMgb2YgQ1BVCj4gPj4+Pj4g
dXNhZ2UuIFNvIHRoaXMgaXMgbm90IG1vcmUgZXhwZW5zaXZlIGluIHRlcm1zIG9mIENQVSBjeWNs
ZXMuCj4gPj4+Pgo+ID4+Pj4gSSBkaXNhZ3JlZS4KPiA+Pj4KPiA+Pj4gU28gZG8gSS4KPiA+Pj4K
PiA+Pj4+Cj4gPj4+PiBIb3dldmVyLCBsZXQncyBiYXNlIHRoaXMgZGlzYWdyZWVtZW50IG9uIHNv
bWUgZXZpZGVuY2UuIEhlcmUgaXMgdGhlCj4gPj4+PiBwcmVzZW50IDMyLWJpdCBBUk0gaW1wbGVt
ZW50YXRpb246Cj4gPj4+Pgo+ID4+Pj4gMDAwMDAwNDggPHZtX2dldF9wYWdlX3Byb3Q+Ogo+ID4+
Pj4gICAgICAgICA0ODogICAgICAgZTIwMDAwMGYgICAgICAgIGFuZCAgICAgcjAsIHIwLCAjMTUK
PiA+Pj4+ICAgICAgICAgNGM6ICAgICAgIGUzMDAzMDAwICAgICAgICBtb3Z3ICAgIHIzLCAjMAo+
ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICA0YzogUl9BUk1fTU9WV19BQlNfTkMgICAu
TEFOQ0hPUjEKPiA+Pj4+ICAgICAgICAgNTA6ICAgICAgIGUzNDAzMDAwICAgICAgICBtb3Z0ICAg
IHIzLCAjMAo+ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICA1MDogUl9BUk1fTU9WVF9B
QlMgICAgICAuTEFOQ0hPUjEKPiA+Pj4+ICAgICAgICAgNTQ6ICAgICAgIGU3OTMwMTAwICAgICAg
ICBsZHIgICAgIHIwLCBbcjMsIHIwLCBsc2wgIzJdCj4gPj4+PiAgICAgICAgIDU4OiAgICAgICBl
MTJmZmYxZSAgICAgICAgYnggICAgICBscgo+ID4+Pj4KPiA+Pj4+IFRoYXQgaXMgZml2ZSBpbnN0
cnVjdGlvbnMgbG9uZy4KPiA+Pj4KPiA+Pj4gT24gcHBjMzIgSSBnZXQ6Cj4gPj4+Cj4gPj4+IDAw
MDAwMDk0IDx2bV9nZXRfcGFnZV9wcm90PjoKPiA+Pj4gICAgICAgICA5NDogM2QgMjAgMDAgMDAg
ICAgIGxpcyAgICAgcjksMAo+ID4+PiAgICAgICAgICAgICAgICAgICAgIDk2OiBSX1BQQ19BRERS
MTZfSEEgICAgIC5kYXRhLi5yb19hZnRlcl9pbml0Cj4gPj4+ICAgICAgICAgOTg6IDU0IDg0IDE2
IGJhICAgICBybHdpbm0gIHI0LHI0LDIsMjYsMjkKPiA+Pj4gICAgICAgICA5YzogMzkgMjkgMDAg
MDAgICAgIGFkZGkgICAgcjkscjksMAo+ID4+PiAgICAgICAgICAgICAgICAgICAgIDllOiBSX1BQ
Q19BRERSMTZfTE8gICAgIC5kYXRhLi5yb19hZnRlcl9pbml0Cj4gPj4+ICAgICAgICAgYTA6IDdk
IDI5IDIwIDJlICAgICBsd3p4ICAgIHI5LHI5LHI0Cj4gPj4+ICAgICAgICAgYTQ6IDkxIDIzIDAw
IDAwICAgICBzdHcgICAgIHI5LDAocjMpCj4gPj4+ICAgICAgICAgYTg6IDRlIDgwIDAwIDIwICAg
ICBibHIKPiA+Pj4KPiA+Pj4KPiA+Pj4+Cj4gPj4+PiBQbGVhc2Ugc2hvdyB0aGF0IHlvdXIgbmV3
IGltcGxlbWVudGF0aW9uIGlzIG5vdCBtb3JlIGV4cGVuc2l2ZSBvbgo+ID4+Pj4gMzItYml0IEFS
TS4gUGxlYXNlIGRvIHNvIGJ5IGJ1aWxkaW5nIGEgMzItYml0IGtlcm5lbCwgYW5kIHByb3ZpZGlu
Zwo+ID4+Pj4gdGhlIGRpc2Fzc2VtYmx5Lgo+ID4+Pgo+ID4+PiBXaXRoIHlvdXIgc2VyaWVzIEkg
Z2V0Ogo+ID4+Pgo+ID4+PiAwMDAwMDAwMCA8dm1fZ2V0X3BhZ2VfcHJvdD46Cj4gPj4+ICAgICAg
MDogICAgIDNkIDIwIDAwIDAwICAgICBsaXMgICAgIHI5LDAKPiA+Pj4gICAgICAgICAgICAgICAg
ICAgICAyOiBSX1BQQ19BRERSMTZfSEEgICAgICAucm9kYXRhCj4gPj4+ICAgICAgNDogICAgIDM5
IDI5IDAwIDAwICAgICBhZGRpICAgIHI5LHI5LDAKPiA+Pj4gICAgICAgICAgICAgICAgICAgICA2
OiBSX1BQQ19BRERSMTZfTE8gICAgICAucm9kYXRhCj4gPj4+ICAgICAgODogICAgIDU0IDg0IDE2
IGJhICAgICBybHdpbm0gIHI0LHI0LDIsMjYsMjkKPiA+Pj4gICAgICBjOiAgICAgN2QgNDkgMjAg
MmUgICAgIGx3enggICAgcjEwLHI5LHI0Cj4gPj4+ICAgICAxMDogICAgIDdkIDRhIDRhIDE0ICAg
ICBhZGQgICAgIHIxMCxyMTAscjkKPiA+Pj4gICAgIDE0OiAgICAgN2QgNDkgMDMgYTYgICAgIG10
Y3RyICAgcjEwCj4gPj4+ICAgICAxODogICAgIDRlIDgwIDA0IDIwICAgICBiY3RyCj4gPj4+ICAg
ICAxYzogICAgIDM5IDIwIDAzIDE1ICAgICBsaSAgICAgIHI5LDc4OQo+ID4+PiAgICAgMjA6ICAg
ICA5MSAyMyAwMCAwMCAgICAgc3R3ICAgICByOSwwKHIzKQo+ID4+PiAgICAgMjQ6ICAgICA0ZSA4
MCAwMCAyMCAgICAgYmxyCj4gPj4+ICAgICAyODogICAgIDM5IDIwIDAxIDE1ICAgICBsaSAgICAg
IHI5LDI3Nwo+ID4+PiAgICAgMmM6ICAgICA5MSAyMyAwMCAwMCAgICAgc3R3ICAgICByOSwwKHIz
KQo+ID4+PiAgICAgMzA6ICAgICA0ZSA4MCAwMCAyMCAgICAgYmxyCj4gPj4+ICAgICAzNDogICAg
IDM5IDIwIDA3IDE1ICAgICBsaSAgICAgIHI5LDE4MTMKPiA+Pj4gICAgIDM4OiAgICAgOTEgMjMg
MDAgMDAgICAgIHN0dyAgICAgcjksMChyMykKPiA+Pj4gICAgIDNjOiAgICAgNGUgODAgMDAgMjAg
ICAgIGJscgo+ID4+PiAgICAgNDA6ICAgICAzOSAyMCAwNSAxNSAgICAgbGkgICAgICByOSwxMzAx
Cj4gPj4+ICAgICA0NDogICAgIDkxIDIzIDAwIDAwICAgICBzdHcgICAgIHI5LDAocjMpCj4gPj4+
ICAgICA0ODogICAgIDRlIDgwIDAwIDIwICAgICBibHIKPiA+Pj4gICAgIDRjOiAgICAgMzkgMjAg
MDEgMTEgICAgIGxpICAgICAgcjksMjczCj4gPj4+ICAgICA1MDogICAgIDRiIGZmIGZmIGQwICAg
ICBiICAgICAgIDIwIDx2bV9nZXRfcGFnZV9wcm90KzB4MjA+Cj4gPj4+Cj4gPj4+Cj4gPj4+IFRo
YXQgaXMgZGVmaW5pdGVseSBtb3JlIGV4cGVuc2l2ZSwgaXQgaW1wbGVtZW50cyBhIHRhYmxlIG9m
IGJyYW5jaGVzLgo+ID4+Cj4gPj4gT2theSwgd2lsbCBzcGxpdCBvdXQgdGhlIFBQQzMyIGltcGxl
bWVudGF0aW9uIHRoYXQgcmV0YWlucyBleGlzdGluZwo+ID4+IHRhYmxlIGxvb2sgdXAgbWV0aG9k
LiBBbHNvIHBsYW5uaW5nIHRvIGtlZXAgdGhhdCBpbnNpZGUgc2FtZSBmaWxlCj4gPj4gKGFyY2gv
cG93ZXJwYy9tbS9tbWFwLmMpLCB1bmxlc3MgeW91IGhhdmUgYSBkaWZmZXJlbmNlIHByZWZlcmVu
Y2UuCj4gPgo+ID4gTXkgcG9pbnQgd2FzIG5vdCB0byBnZXQgc29tZXRoaW5nIHNwZWNpZmljIGZv
ciBQUEMzMiwgYnV0IHRvIGFtcGxpZnkgb24KPiA+IFJ1c3NlbGwncyBvYmplY3Rpb24uCj4gPgo+
ID4gQXMgdGhpcyBpcyBiYWQgZm9yIEFSTSBhbmQgYmFkIGZvciBQUEMzMiwgZG8gd2UgaGF2ZSBh
bnkgZXZpZGVuY2UgdGhhdAo+ID4geW91ciBjaGFuZ2UgaXMgZ29vZCBmb3IgYW55IG90aGVyIGFy
Y2hpdGVjdHVyZSA/Cj4gPgo+ID4gSSBjaGVja2VkIFBQQzY0IGFuZCB0aGVyZSBpcyBleGFjdGx5
IHRoZSBzYW1lIGRyYXdiYWNrLiBXaXRoIHRoZSBjdXJyZW50Cj4gPiBpbXBsZW1lbnRhdGlvbiBp
dCBpcyBhIHNtYWxsIGZ1bmN0aW9uIHBlcmZvcm1pbmcgdGFibGUgcmVhZCB0aGVuIGEgZmV3Cj4g
PiBhZGp1c3RtZW50LiBBZnRlciB5b3VyIGNoYW5nZSBpdCBpcyBhIGJpZ2dlciBmdW5jdGlvbiBp
bXBsZW1lbnRpbmcgYQo+ID4gdGFibGUgb2YgYnJhbmNoZXMuCj4KPiBJIGFtIHdvbmRlcmluZyBp
ZiB0aGlzIHdvdWxkIG5vdCBiZSB0aGUgY2FzZSBmb3IgYW55IG90aGVyIHN3aXRjaCBjYXNlCj4g
c3RhdGVtZW50IG9uIHRoZSBwbGF0Zm9ybSA/IElzIHRoZXJlIHNvbWV0aGluZyBzcGVjaWZpYy9k
aWZmZXJlbnQganVzdAo+IG9uIHZtX2dldF9wYWdlX3Byb3QoKSBpbXBsZW1lbnRhdGlvbiA/IEFy
ZSB5b3Ugc3VnZ2VzdGluZyB0aGF0IHN3aXRjaAo+IGNhc2Ugc3RhdGVtZW50cyBzaG91bGQganVz
dCBiZSBhdm9pZGVkIGluc3RlYWQgPwo+Cj4gPgo+ID4gU28sIGFzIHJlcXVlc3RlZCBieSBSdXNz
ZWxsLCBjb3VsZCB5b3UgbG9vayBhdCB0aGUgZGlzYXNzZW1ibHkgZm9yIG90aGVyCj4gPiBhcmNo
aXRlY3R1cmVzIGFuZCBzaG93IHVzIHRoYXQgQVJNIGFuZCBQT1dFUlBDIGFyZSB0aGUgb25seSBv
bmVzIGZvcgo+ID4gd2hpY2ggeW91ciBjaGFuZ2UgaXMgbm90IG9wdGltYWwgPwo+Cj4gQnV0IHRo
ZSBwcmltYXJ5IHB1cnBvc2Ugb2YgdGhpcyBzZXJpZXMgaXMgbm90IHRvIGd1YXJhbnRlZSBvcHRp
bWl6ZWQKPiBjb2RlIG9uIHBsYXRmb3JtIGJ5IHBsYXRmb3JtIGJhc2lzLCB3aGlsZSBtaWdyYXRp
bmcgZnJvbSBhIHRhYmxlIGJhc2VkCj4gbG9vayB1cCBtZXRob2QgaW50byBhIHN3aXRjaCBjYXNl
IHN0YXRlbWVudC4KPgo+IEJ1dCBpbnN0ZWFkLCB0aGUgcHVycG9zZXMgaXMgdG8gcmVtb3ZlIGN1
cnJlbnQgbGV2ZWxzIG9mIHVubmVjZXNzYXJ5Cj4gYWJzdHJhY3Rpb24gd2hpbGUgY29udmVydGlu
ZyBhIHZtX2ZsYWdzIGFjY2VzcyBjb21iaW5hdGlvbiBpbnRvIHBhZ2UKPiBwcm90ZWN0aW9uLiBU
aGUgc3dpdGNoIGNhc2Ugc3RhdGVtZW50IGZvciBwbGF0Zm9ybSBpbXBsZW1lbnRhdGlvbiBvZgo+
IHZtX2dldF9wYWdlX3Byb3QoKSBqdXN0IHNlZW1lZCBsb2dpY2FsIGVub3VnaC4gQ2hyaXN0b3Bo
J3Mgb3JpZ2luYWwKPiBzdWdnZXN0aW9uIHBhdGNoIGZvciB4ODYgaGFkIHRoZSBzYW1lIGltcGxl
bWVudGF0aW9uIGFzIHdlbGwuCj4KPiBCdXQgaWYgdGhlIHRhYmxlIGxvb2sgdXAgaXMgc3RpbGwg
YmV0dGVyL3ByZWZlcnJlZCBtZXRob2Qgb24gY2VydGFpbgo+IHBsYXRmb3JtcyBsaWtlIGFybSBv
ciBwcGMzMiwgd2lsbCBiZSBoYXBweSB0byBwcmVzZXJ2ZSB0aGF0LgoKSSBkb3VidCB0aGUgc3dp
dGNoKCkgdmFyaWFudCB3b3VsZCBnaXZlIGJldHRlciBjb2RlIG9uIGFueSBwbGF0Zm9ybS4KCldo
YXQgYWJvdXQgdXNpbmcgdGFibGVzIGV2ZXJ5d2hlcmUsIHVzaW5nIGRlc2lnbmF0ZWQgaW5pdGlh
bGl6ZXJzCnRvIGltcHJvdmUgcmVhZGFiaWxpdHk/CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAg
ICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUn
cyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBw
ZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2Vs
ZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNh
eSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4
LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
