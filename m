Return-Path: <SRS0=yFMY=5L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E125C43331
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 02:47:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28DF120737
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 02:47:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KL3A2Rb4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vzqs90GT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28DF120737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L2rGTO2a4QpcmfST0Qk18rUhG/si6pkX3PvqvX1al0w=; b=KL3A2Rb4yV/l9x
	VEJiz9atyC00NzrA/nJ2fURtDAaz2Iz3V9X+G/uzWayEbTe2lIbMPWK1l4MwD129XdXgQI+enR5x0
	OhL8bCE+qrV99HNcG24C3QmPH3a6Y8VclNqiOYvJB0wVFaiq6Ubas31nv4hxARu4Tq0J6/VhnAW2c
	fHmAcgpQfSZo53kOAK///NZjwzlzUiJg9wAEvXqdkcFtIQWSkViP1mn409zDfSPp0Sbn1mk7w6VFs
	/6LWzWCnguaBfJ/dxBFTdz5TeHon1DPH32vxsKkJY93YpPaSWCjldNrOZLiNdpizBfiPSqV3JC5+x
	5nUT89xpj+pAlBdFX99g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHIYH-0000Kh-7K; Thu, 26 Mar 2020 02:47:25 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHIYE-0000KE-FR
 for linux-snps-arc@lists.infradead.org; Thu, 26 Mar 2020 02:47:23 +0000
Received: by mail-pl1-x643.google.com with SMTP id b9so1573988pls.12
 for <linux-snps-arc@lists.infradead.org>; Wed, 25 Mar 2020 19:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZC2JWDC93IXxm3DiT5pIOsVgm+udWK1Q92i+faS6l8I=;
 b=Vzqs90GToQunkcucIUeGNBIHE5XoHRcEpG53o4w8v0I7EEGAVXrNp0At/WFB5ziWQZ
 zjGV6AFdE5/PPL0ptTr0zclPMo9H4FRiv3kSy6enfcPIWGR66AdAr6l3ycJajq+i3QOM
 WabwcG6j6QyKLQWe7tMeEGQvgm5f/3hOSszNQhRJ51gchIG8pnyeOVWzQSRPlznE9NoQ
 LdD9c+syZktf1pYCtoRdTTi9JonkM41+6b0Z0/pXwv9Gn/Jv+g6CKJWZamPKz3o4Ybz+
 /VTCJPRUE4wDmxy0zDmnJn0YLDKqT+KZMeHb2nlI2NXdQYRQk0U8UvlfJ/SrO54XXF39
 4jfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZC2JWDC93IXxm3DiT5pIOsVgm+udWK1Q92i+faS6l8I=;
 b=nAojuG5ao5dviLK/REzx39h0VHifRNEtKu8VLfwXCIkA1AQSaHdd4FpZJNDk42IBv2
 Cjpek3oZgW1fCVm3Am5a6nOzZgrpuEL4zYqelB2x1TnNQDlgOjHrYdFIoA86TZX3Oy8I
 URGnxbZ7CGM2qIZPJ82M6GokUHLtYtq9lhj12Ldxgq2hGFO5OF+Ws2Uy4KWCG06kH9uT
 Vm9BWDJoB1olD4ni19LgMPsYxpLGh69t3+j78SOih5dKEfE0ffy+vxVChbftYxzxcp6Q
 TKsU8eMrGG90ICxywUUb+0LZuGWqyNaexBNDbtIayuDXlyZl9Vocb7O7dp8sJKs7IBYb
 GZow==
X-Gm-Message-State: ANhLgQ0IURRroaHedd+om2exxqCH7raZp2I85SDsuTiRL6WvT84sJia/
 HfUF2iGCAnifpg4UvB4qu/A=
X-Google-Smtp-Source: ADFU+vuem3ixNDxcPQayi6gtROW1HNvcbcrfj1nz59TKboaz3UkUFif3Qai27a7YOeQgSkb9XBwKNQ==
X-Received: by 2002:a17:90a:3acc:: with SMTP id
 b70mr629367pjc.179.1585190841884; 
 Wed, 25 Mar 2020 19:47:21 -0700 (PDT)
Received: from ?IPv6:2601:641:c100:83a0:24c5:8a14:3f19:e6c8?
 ([2601:641:c100:83a0:24c5:8a14:3f19:e6c8])
 by smtp.gmail.com with ESMTPSA id a3sm413730pfg.172.2020.03.25.19.47.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Mar 2020 19:47:21 -0700 (PDT)
Subject: Re: [PATCH v4 04/15] ARC: Thread Local Storage support
To: Joseph Myers <joseph@codesourcery.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-5-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003260157030.31593@digraph.polyomino.org.uk>
From: Vineet Gupta <vineetg76@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=vineetg76@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFEffBMBEADIXSn0fEQcM8GPYFZyvBrY8456hGplRnLLFimPi/BBGFA24IR+B/Vh/EFk
 B5LAyKuPEEbR3WSVB1x7TovwEErPWKmhHFbyugdCKDv7qWVj7pOB+vqycTG3i16eixB69row
 lDkZ2RQyy1i/wOtHt8Kr69V9aMOIVIlBNjx5vNOjxfOLux3C0SRl1veA8sdkoSACY3McOqJ8
 zR8q1mZDRHCfz+aNxgmVIVFN2JY29zBNOeCzNL1b6ndjU73whH/1hd9YMx2Sp149T8MBpkuQ
 cFYUPYm8Mn0dQ5PHAide+D3iKCHMupX0ux1Y6g7Ym9jhVtxq3OdUI5I5vsED7NgV9c8++baM
 7j7ext5v0l8UeulHfj4LglTaJIvwbUrCGgtyS9haKlUHbmey/af1j0sTrGxZs1ky1cTX7yeF
 nSYs12GRiVZkh/Pf3nRLkjV+kH++ZtR1GZLqwamiYZhAHjo1Vzyl50JT9EuX07/XTyq/Bx6E
 dcJWr79ZphJ+mR2HrMdvZo3VSpXEgjROpYlD4GKUApFxW6RrZkvMzuR2bqi48FThXKhFXJBd
 JiTfiO8tpXaHg/yh/V9vNQqdu7KmZIuZ0EdeZHoXe+8lxoNyQPcPSj7LcmE6gONJR8ZqAzyk
 F5voeRIy005ZmJJ3VOH3Gw6Gz49LVy7Kz72yo1IPHZJNpSV5xwARAQABtC1WaW5lZXQgR3Vw
 dGEgKHBlcnNvbmFsKSA8dmluZWV0Zzc2QGdtYWlsLmNvbT6JAj4EEwECACgCGwMGCwkIBwMC
 BhUIAgkKCwQWAgMBAh4BAheABQJdcAXyBQkVtotfAAoJEGnX8d3iisJeH6EP/ip0xGS2DNI4
 2za/eRU85Kc+wQhz/NWhDMCl3xWzKLBO4SaOMlfp7j4vgogj7ufok7I7Ke0Tvww9kbk+vgeg
 ERlcGd+OczDX4ze4EabgW5z8sMax84yqd/4HVJBORGtjR5uXh0fugKrTBGA5AJMf/qGyyHZX
 8vemIm7gQK7aUgkKId9D4O1wIdgrUdvg8ocFw9a1TWv6s3keyJNfqKKwSNdywKbVdkMFjLcL
 d6jHP9ice59Fkh4Lhte6DfDx4gjbhF1gyoqSL/JvaBLYJTdkl2tGzM/CYSqOsivUH9//X5uT
 ijG3mkIqb//7H1ab/zgF0/9jxjhtiKYwl71NN9Zm2rJiGegLxv61RjEZT2oEacZXIyXqZSh/
 vz8rWOBAr1EE76XzqC5TC6qa5Xdo2Q9g5d9p7pkQ9WFfDAQujrB8qZIS6IwhFPSZQIGUWB5x
 F/CskhsxXOgPL0isSv6a5OB2jd3G78/o7GfDSaiOVzgL4hx4gIY0aQqANuNlLC8q55fYquMS
 lO4FqcpaK5yt81uzPTv8HetA1577Yeur9aPjgZpqHI35f6V7uQdDRQlI8kmkm/ceWAxbliR3
 YjH32HRGpOc6Z3q1gGSruPnpjeSRVjb8GJGEIWLbhcyF/kRV6T6vcER3x4LaBnmU17uE5vw4
 789n0dLVksMviHzcGg1/8WUvuQINBFEffBMBEADXZ2pWw4Regpfw+V+Vr6tvZFRl245PV9rW
 FU72xNuvZKq/WE3xMu+ZE7l2JKpSjrEoeOHejtT0cILeQ/Yhf2t2xAlrBLlGOMmMYKK/K0Dc
 2zf0MiPRbW/NCivMbGRZdhAAMx1bpVhInKjU/6/4mT7gcE57Ep0tl3HBfpxCK8RRlZc3v8BH
 OaEfcWSQD7QNTZK/kYJo+Oyux+fzyM5TTuKAaVE63NHCgWtFglH2vt2IyJ1XoPkAMueLXay6
 enSKNci7qAG2UwicyVDCK9AtEub+ps8NakkeqdSkDRp5tQldJbfDaMXuWxJuPjfSojHIAbFq
 P6QaANXvTCSuBgkmGZ58skeNopasrJA4z7OsKRUBvAnharU82HGemtIa4Z83zotOGNdaBBOH
 NN2MHyfGLm+kEoccQheH+my8GtbH1a8eRBtxlk4c02ONkq1Vg1EbIzvgi4a56SrENFx4+4sZ
 cm8oItShAoKGIE/UCkj/jPlWqOcM/QIqJ2bR8hjBny83ONRf2O9nJuEYw9vZAPFViPwWG8tZ
 7J+ReuXKai4DDr+8oFOi/40mIDe/Bat3ftyd+94Z1RxDCngd3Q85bw13t2ttNLw5eHufLIpo
 EyAhTCLNQ58eT91YGVGvFs39IuH0b8ovVvdkKGInCT59Vr0MtfgcsqpDxWQXJXYZYTFHd3/R
 swARAQABiQIlBBgBAgAPAhsMBQJdcAYOBQkVtot7AAoJEGnX8d3iisJeCGAP/0QNMvc0QfIq
 z7CzZWSai8s74YxxzNRwTigxgx0YjHFYWDd6sYYdhqFSjeQ6p//QB5Uu+5YByzM2nHiDH0ys
 cL0iTZIz3IEq/IL65SNShdpUrzD3mB/gS95IYxBcicRXXFA7gdYDYmX86fjqJO2dCAhdO2l/
 BHSi6KOaM6BofxwQz5189/NsxuF03JplqLgUgkpKWYJxkx9+CsQL+gruDc1iS9BFJ6xoXosS
 2ieZYflNGvslk1pyePM7miK5BaMZcpvJ/i50rQBUEnYi0jGeXxgbMSuLy/KiNLcmkKucaRO+
 h2g0nxEADaPezfg5yBrUYCvJy+dIO5y2wS80ayO16yxkknlN1y4GuLVSj4vmJWiT6DENPWmO
 fQADBBcHsexVV8/CjCkzfYiXPC7dMAT7OZE+nXSZJHQiCR0LUSToICFZ+Pntj1bjMLu9mDSy
 AtnheBEXom1b7TTHOZ13HuU4Cue9iNoACjVbbF9Zg4+YRmvtcPy8tTo5DXBdysrF7sO/yWGu
 ukgWa2otyae8BC7qBYFbm6uk9wMbYSN3yYBmbiAULMrBKA33iWlE0rIKMv91a2DVjp4NiOSu
 gyyFD9n83Sn4lcyjdLvBUCn9zgY4TwufG/ozyF2hSmO3iIzqt0GxmpQ+pBXk/m51D/UoTWGl
 deE0Dvw98SWmZSNtdOPnJZ0D
Message-ID: <cdd84736-2966-c5b4-a4b4-1705c44f3c69@gmail.com>
Date: Wed, 25 Mar 2020 19:47:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2003260157030.31593@digraph.polyomino.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_194722_518325_A9127BF8 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-snps-arc@lists.infradead.org, libc-alpha@sourceware.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/25/20 6:57 PM, Joseph Myers wrote:
> On Thu, 12 Mar 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> +-- Derive offsets relative to the thread register.
>> +#define thread_offsetof(mem)	(long)(offsetof(struct pthread, mem) - sizeof(struct pthread))
> 
> Missing spaces before '(' in calls to offsetof and sizeof.

Fixed.

> 
>> +TLS_TCB_SIZE            	sizeof(tcbhead_t)
>> +
>> +PTHREAD_TID			offsetof(struct pthread, tid)
> 
> Likewise.
> 

Fixed.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
