Return-Path: <SRS0=RZv2=45=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58137C1975A
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Mar 2020 21:23:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAA5E206BE
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Mar 2020 21:23:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r8uH98YB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Lxpf6KM0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ImOZDmGn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAA5E206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7voOSrMevF7ON+9Ewrb1SYm4xsJoN/OCBveti01w0Y=; b=r8uH98YBAIXI9X
	LFZj7+/+iZI3xDyAmvdfAOjvDEbPMXeau+swhMo8VhSfPCrG6eW+rFPFRFHNpLEByDguMvV9wXkAQ
	hpCXpHY3IIXAlgT9+7ZBeAnQfnkGr2yl8SSoJkIhasinAXLqAnGw2tWrNdXDn/m9F7daFI0OFlOt6
	EnDkAduknehUfOObWDy18Z5G5ps6Q7UWif9LsxNHpEplL0B8fDTTG6vckqx4YwhL5A5n+hdxm6Hyv
	z1Ao3ByIvuSLlabgIea7njI4TBi0Vh57eUU+VTVtoJbyqm8lpNbqS2gDNVMdl9YrR0V8l//L8ans8
	bx5uKTroIPIDxZEc6CGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCVIo-0001Z6-Gv; Thu, 12 Mar 2020 21:23:38 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCVIk-0001YS-W4
 for linux-snps-arc@lists.infradead.org; Thu, 12 Mar 2020 21:23:36 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B1FEA400DE;
 Thu, 12 Mar 2020 21:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1584048214; bh=c5zVZtLHeoMXR3lxsv45Bby44Kpltd040kY2zxR/hNk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Lxpf6KM0sebDVmuJKDQ/fUUC/l3+olnRxo1EGbl04fVIU4GKXdIhIjpRJrrQjeTNp
 rd2ADJGzbsRIFQ8ZECpirvguaTy1GZwna6e4XowfDvFxc9QImravGDUxgAWiA87xxg
 xj2ztavaAvJTi+LAhenzFAt6RJRLly+db9MXYtIPbiygnvb2WvRPTjvW1o09SCQjdW
 /6UgM2mwPNxkcoOC46Ncpv2baDfpxFERsz6VtuRzU6KMwErJRitT6efgLw0Qf/Qugs
 MqG94fYt/D7WFjJLvTbTeHuStkgRy0MQyuzq4LAfxjjq8jjJdGAl0BxhYV/xBMkEce
 yJb9MlHEwgJSQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 0CF0CA0083;
 Thu, 12 Mar 2020 21:23:25 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 12 Mar 2020 14:23:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 12 Mar 2020 14:23:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHCqmS2ysqLO2TrxNgAC5SNhZCSzUdHZGsaEhXn0QT+X7G33RhgJIzhVGQqYAZd1hedJwafLtjA2XbFZ76eZfoTF8ta/eqpdK4fPWCeA4TgpItpZu1pMdWdvDV2pRGyo7IuLLYZkvSvLn5fFK9xGsaHvPiKCbOKoNz2wenE9YWaeqejy6IYyBSHlBT148gDhTO85ZYiqsDqZdciHtUaYKmCUXQD6l9mcebv3Imz+4QozWMNgLcSrnk1tNnKZgha2bV0suK6JI5t3B2T/B4A6BjxrOHwe29dUGF3OKa8uY6tKyEzi0RcTrnIu4XZ6FhVX1NFyosGuQoFO4rB050TGVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5zVZtLHeoMXR3lxsv45Bby44Kpltd040kY2zxR/hNk=;
 b=GrVOF0LeAShz3QhCwk6VPW+LGOkY2+nqkCp+3CWgtjbvZ9XqcZ1pIl5cUIyWuECeW+HfZ9aqwEMKrIoe3D7XjKfpvzD7IUA/wvi5nMF6TH6ENd3ZxXxwyJ8eUFwVePgi3fFadOV72CcaoX0s46/r0ALoKErXxu8G5lF+kmDE1XlPqx/WZE3J7KsFudTnWWNQr2fNe+G/unmjavNMNVv3zeLyNZo5wQ7BT2x2XmydD3vXnuJxBJ7agRVZcrY+jETqirJ2VkB9Mpsuffn7w+Rga2KnXsyWOdL1OKlzwMjhnveEEX5ECotFA0xbHLi7LaVmpSd1XF1jdiylzxEChWOD5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5zVZtLHeoMXR3lxsv45Bby44Kpltd040kY2zxR/hNk=;
 b=ImOZDmGn/dX43usqOmej0NKU8XYbQAB0iOq2DxlD+xiAU1hSgAZuhASoHupvhm5DkW6Dg0ZRBpdnMX7H6W19znxLF3Y/g/ENXYdrQ5+p8JpoTwlKTpDi4XEdtwoAo1uucrH3zYP3Y+HPPYSDetU+HrZ5LyfJGDZ7RrD1EHBN4PY=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3317.namprd12.prod.outlook.com (2603:10b6:a03:d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.14; Thu, 12 Mar
 2020 21:23:12 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.018; Thu, 12 Mar 2020
 21:23:12 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v3 00/17] glibc port to ARC processors
Thread-Topic: [PATCH v3 00/17] glibc port to ARC processors
Thread-Index: AQHV8+SKFbj1Ab7BHEKnet7tWnF7XKg8RNKAgAAKGYCAAAOrgIAJLnwA
Date: Thu, 12 Mar 2020 21:23:12 +0000
Message-ID: <7ac0aa7f-9c1c-d889-a087-2608932091b2@synopsys.com>
References: <20200306182419.13945-1-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003070020370.26274@digraph.polyomino.org.uk>
 <cc9d1b80-1568-f658-ce65-fdacad669956@synopsys.com>
 <alpine.DEB.2.21.2003070108590.26274@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003070108590.26274@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fda7b471-51a1-4c44-c125-08d7c6cb91bc
x-ms-traffictypediagnostic: BYAPR12MB3317:
x-microsoft-antispam-prvs: <BYAPR12MB3317A886476DCE3F8C17B368B6FD0@BYAPR12MB3317.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0340850FCD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10001)(10019020)(376002)(366004)(346002)(396003)(39860400002)(136003)(199004)(4744005)(66446008)(76116006)(66946007)(6486002)(2906002)(31686004)(31696002)(54906003)(2616005)(5660300002)(36756003)(316002)(64756008)(26005)(66556008)(81156014)(6512007)(6916009)(81166006)(478600001)(66476007)(8936002)(53546011)(8676002)(186003)(6506007)(4326008)(71200400001)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3317;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3Xb0nGZW1EjgCqjkDgmQkKFpWe5oCaAI1Hvmkb1uFaDaX+lyPrwDdYv+HFgV6fDIPN+EE0ekSWNj9aeCS61vN7deehZtHgCY2B0cSyUbk3PxVW9cgPy/YilRCpyxaB2HaKL11YDV0cYBm+mj1M3T54Sufp4itevha8exMiG/2wL+waGQocDdubCrTCNiEtZnJmNZggKSpKqUxGd6nn2xCyeHReJQyGsvQ5GutHtLcZCL7Q34vrLXjj/JiySg/b0qZkwnpyG3vNHURqY3yVKKMy0A77t54N4efUSveJJ7XRUFWRGD3cwwMnd5NIZsXHy6e+cssx1MBR1TNHxaJUjgq0uCNRjlfYBTo2VthaUUKj0llD1ZuTVrU41DLY5XzFiQqDQgJtP4VYZBTdSREtu0Oa/MA0Buvds4AUuhECyhTXOAzkMM9rsq26eZWGznT7aH+7dF/E0QjRaszYaOb54JRAwd8txxrOV24AtPBOnrwsPrV1g03v3lI1O7onyaFkoeigqBlMHMQLtK1BnCnOrSY07v8r6bI+HNv67yxIMqy/Af5+1/yLTEjSEvR9FczUIXeXeWNEFvZ7UiSX0ugymwAQ==
x-ms-exchange-antispam-messagedata: LsyNWaRsy/Moty/1OLTz3yY0tWqvdvZPVDh8lwQL01W2kK6meNs6AHAqzK9OPGhupKrIaLOHLaNAL3ZxUfJue6wRopIzrDidw1xesPlU+tAZNMJAPGYP2kaiRd7oaDRbt3J1zyLeQJuLF9ycpm+BaA==
x-ms-exchange-transport-forked: True
Content-ID: <6CB2FF1C0AD2514C82F7DA8D084D8111@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fda7b471-51a1-4c44-c125-08d7c6cb91bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2020 21:23:12.0742 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cwX/ItGFXgUoVJx3arH5ktnBzcI9jAVPg297HmPeOxuKh/9fIfLOKTrtT3eukXZPfj1RFvbVLBKxEERgFrX6TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3317
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_142335_129867_18447F82 
X-CRM114-Status: GOOD (  10.30  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Joseph,

On 3/6/20 5:10 PM, Joseph Myers wrote:
> On Sat, 7 Mar 2020, Vineet Gupta wrote:
> 
>> On 3/6/20 4:21 PM, Joseph Myers wrote:
>>> Please give details of what the entries would be for 
>>> <https://sourceware.org/glibc/wiki/ABIList> and 
>> ARC
>>    * 32-bit, hard-float, LE: /lib/ld-linux-arc.so.2
>>    * 32-bit, soft-float, LE: /lib/ld-linux-arc.so.2
>>
>> (soft-float ABI is compatible with hardware-float builds in terms of calling
>> convention, register-file etc)
> So that should actually be one bullet-point entry for soft-float ABI, 
> rather than two entries, because it's a single ABI, with a clarifying note 
> following like those for some other architectures.

Are you waiting for me to fold the 64-bit time stuff and a respin for a more in
depth review of the patchset. I appreciate you have a zillion other things backed
up on your todo list :-)

Let me know how to proceed.

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
