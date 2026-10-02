Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F218DCA5FD4
	for <linux-snps-arc@archiver.kernel.org>; Fri,  2 Oct 2026 05:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C57VSw2O6RtXGiGcmzhFyZ+Cb2nsqD3z5Pal5ki0/ko=; b=WE0c94ZF6ytBHt
	i8eRJ2ItPggoIiYfN4p4ez7PX26/L5rRPb3DgDDaEw5QsML4r4aBfWxcds1dHwDA2qPPBymqEsi/5
	vzugsyaxL9G+YzjGGTdSHT7xUsr+57T/NHRfGdywCQ5/3Sh+rvr9y3whdciuYSduvoNaxT4fMoqxG
	27DgnYk5dbiQKlMwtNGTJQCsndJ1nEgoDeZJ/m45SDbDCil3tvksRsTaJLZG+gs5c6AJDLUl5nYYE
	us4xHVz2jYY9DCk89dkjDyI0sag7JCSaD3ILvjwLxAdroLZ/OSIc29O6Q61rxYkbod3A6UZqbFPEq
	zewzh+pOvaH+ceOtT2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWF2-0000000Afx2-2CbY;
	Fri, 02 Oct 2026 05:55:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWF0-0000000Afwc-2au0
	for linux-snps-arc@lists.infradead.org;
	Fri, 02 Oct 2026 05:55:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E84BA41A3F;
	Fri,  2 Oct 2026 05:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA421F00893;
	Fri,  2 Oct 2026 05:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790920529;
	bh=teFEjoGk60hAbwZymf2+s37EdO1MwSiFUps+HmGIonM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hlyf3B/3jW5Fjj/XlutaeoqUTgnIkcJz3K27C+78KPSM6jFqxqPDR9YGni1RNxw0j
	 S30K8I0anbPyx6df5YR3YefCl3DsNcJ5zbxgF0Qu8QYhiY/grpLHJj7C8VDLAVzves
	 O2vlOKRNf+VQjYIgL3rpiRYyUO8lHQestRe3ATr8=
Date: Fri, 2 Oct 2026 07:55:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-serial@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	"open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] serial: arc_uart: Use platform IRQ helper
Message-ID: <2026100211-unturned-scam-fd80@gregkh>
References: <20260925183050.56839-1-rosenp@gmail.com>
 <2026100129-unrest-cleaver-6528@gregkh>
 <CAKxU2N8Z-CSxki5mWQvJCEiQDmy00WLJqPEMgujOA0LQzbHHjw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKxU2N8Z-CSxki5mWQvJCEiQDmy00WLJqPEMgujOA0LQzbHHjw@mail.gmail.com>
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

T24gVGh1LCBPY3QgMDEsIDIwMjYgYXQgMTE6NTg6MDVBTSAtMDcwMCwgUm9zZW4gUGVuZXYgd3Jv
dGU6Cj4gT24gVGh1LCBPY3QgMSwgMjAyNiBhdCAxOjQy4oCvQU0gR3JlZyBLcm9haC1IYXJ0bWFu
Cj4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIFNl
cCAyNSwgMjAyNiBhdCAxMTozMDo1MEFNIC0wNzAwLCBSb3NlbiBQZW5ldiB3cm90ZToKPiA+ID4g
QXZvaWQgY2FsbGluZyBpcnFfZGlzcG9zZV9tYXBwaW5nKCkgYnkgbGV0dGluZyB0aGUgcGxhdGZv
cm1fZGV2aWNlCj4gPiA+IG1hY2hpbmVyeSBoYW5kbGUgaXQuIEFsc28gZW5hYmxlIHBvc3NpYmls
aXR5IG9mIGhhbmRsaW5nIC1FUFJPQkVfREVGRVIKPiA+ID4gYW5kIG90aGVyIGVycm9ycy4gSGFu
ZGxlIGFzIGVhcmx5IGFzIHBvc3NpYmxlIHRvIGF2b2lkIGRvaW5nIHVubmVjZXNzYXJ5Cj4gPiA+
IHdvcmsuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvc2VuIFBlbmV2IDxyb3NlbnBAZ21h
aWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvdHR5L3NlcmlhbC9hcmNfdWFydC5jIHwg
OCArKysrKystLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9hcmNf
dWFydC5jIGIvZHJpdmVycy90dHkvc2VyaWFsL2FyY191YXJ0LmMKPiA+ID4gaW5kZXggMzk4OGU1
OTU4ODk2Li5iNDZiMDU3YTE4MWIgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvdHR5L3Nlcmlh
bC9hcmNfdWFydC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9hcmNfdWFydC5jCj4g
PiA+IEBAIC0zMCw3ICszMCw2IEBACj4gPiA+ICAjaW5jbHVkZSA8bGludXgvdHR5X2ZsaXAuaD4K
PiA+ID4gICNpbmNsdWRlIDxsaW51eC9zZXJpYWxfY29yZS5oPgo+ID4gPiAgI2luY2x1ZGUgPGxp
bnV4L2lvLmg+Cj4gPiA+IC0jaW5jbHVkZSA8bGludXgvb2ZfaXJxLmg+Cj4gPiA+ICAjaW5jbHVk
ZSA8bGludXgvb2ZfYWRkcmVzcy5oPgo+ID4gPgo+ID4gPiAgLyoqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioKPiA+ID4gQEAgLTU3MSwxMiArNTcwLDE3IEBAIHN0YXRpYyBpbnQg
YXJjX3NlcmlhbF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiAgICAg
ICBzdHJ1Y3QgYXJjX3VhcnRfcG9ydCAqdWFydDsKPiA+ID4gICAgICAgc3RydWN0IHVhcnRfcG9y
dCAqcG9ydDsKPiA+ID4gICAgICAgaW50IGRldl9pZDsKPiA+ID4gKyAgICAgaW50IGlycTsKPiA+
ID4gICAgICAgdTMyIHZhbDsKPiA+ID4KPiA+ID4gICAgICAgLyogbm8gZGV2aWNlIHRyZWUgZGV2
aWNlICovCj4gPiA+ICAgICAgIGlmICghbnApCj4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1F
Tk9ERVY7Cj4gPiA+Cj4gPiA+ICsgICAgIGlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7
Cj4gPiA+ICsgICAgIGlmIChpcnEgPCAwKQo+ID4gPiArICAgICAgICAgICAgIHJldHVybiBpcnE7
Cj4gPiA+ICsKPiA+ID4gICAgICAgZGV2X2lkID0gb2ZfYWxpYXNfZ2V0X2lkKG5wLCAic2VyaWFs
Iik7Cj4gPiA+ICAgICAgIGlmIChkZXZfaWQgPCAwKQo+ID4gPiAgICAgICAgICAgICAgIGRldl9p
ZCA9IDA7Cj4gPiA+IEBAIC02MDcsNyArNjExLDcgQEAgc3RhdGljIGludCBhcmNfc2VyaWFsX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+ICAgICAgICAgICAgICAgcmV0
dXJuIFBUUl9FUlIocG9ydC0+bWVtYmFzZSk7Cj4gPiA+ICAgICAgIH0KPiA+ID4KPiA+ID4gLSAg
ICAgcG9ydC0+aXJxID0gaXJxX29mX3BhcnNlX2FuZF9tYXAobnAsIDApOwo+ID4gPiArICAgICBw
b3J0LT5pcnEgPSBpcnE7Cj4gPiA+Cj4gPiA+ICAgICAgIHBvcnQtPmRldiA9ICZwZGV2LT5kZXY7
Cj4gPiA+ICAgICAgIHBvcnQtPmlvdHlwZSA9IFVQSU9fTUVNOwo+ID4gPiAtLQo+ID4gPiAyLjU1
LjAKPiA+ID4KPiA+ID4KPiA+Cj4gPiBZb3UgZm9yZ290IGFuIEFzc2lzdGVkLWJ5OiB0YWcgaGVy
ZSA6KAo+IE5vIExMTSB1c2VkIGhlcmUuCgpUaGVuIHdoYXQgdG9vbCB3YXMgdXNlZCB0byBmaW5k
IHRoaXMgaXNzdWU/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXNucHMtYXJjCg==
