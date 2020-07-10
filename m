Return-Path: <SRS0=2YWT=AV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C93C433E5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 20:07:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 190F92076A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 20:07:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fwY1pJGH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="j8eSv/PB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lsTLG3wv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 190F92076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oXDUQSEo4s87tAjaV/rgmCb7peyyVxa6GiBQxdnx5C4=; b=fwY1pJGHs6ykWq/r/uFCnXzPT
	8nyHIkGXRhZP9gvKNlU1d5zkELXAzwnp4E4wfxr/0WiY66jzBViQwIa5vywNTlRfdR45ZoLT0Zjmo
	Mno0mnowLFdjtS2vfbmY432mvR2RYyhCTGYMhWOrppRiYHwmlAKVjdDGrbFzdH2jGBFA3qVFkJQmy
	QZSfyt3zsH9uO0QH6T98UylfxTuHP2JCmwfSybEuRQ4UzoisLbsYVY/oLrmDTuFVVDSxcZNMs9Gm6
	qb8wzrGgwJb641LQoexChE/OkmQuOAat94pZjxjhGfzIitetTroCBMoz19BjgngdoWJKvz9QUuxP0
	rP8pv2pyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtzJ2-0001Sc-KK; Fri, 10 Jul 2020 20:07:36 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtzIz-0001S7-Pw
 for linux-snps-arc@lists.infradead.org; Fri, 10 Jul 2020 20:07:35 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D6D75401EF;
 Fri, 10 Jul 2020 20:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594411649; bh=Z2PJc1J5PWP26lGdyMprAw05GtZgB1cyUeHKYbvWZiM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=j8eSv/PBqwAGituRq/bj1CrfWgbVirxHwXkeFE3mxXSiKR7xiMyzZ5gBPkesgC/sn
 s7HI2pg0Dlyh1KSzI/t4ZAH2MDd3dRdAzGmL0ELYdy9Sx1kV2mWPbz/RSnQnEgQM1y
 +QHrnZPbRRyfCSIoDJC04Z8dZRDZd6RspD8wuN2bX8wqmTMA5EKUs0S7AfHgldHxKf
 WOUbwNZZAKMt4s81unow2KcOn+itzceEC2n2fi7p4dwED/kSIQ84Syoo5n2oKNoib1
 OaP2bKX4k24ljOql7uHI8l4YC8mPFtMYIRLwSYUfvATFAT0emNYNVqjRIcPwiRb/ay
 WmwdOxBMWUngQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id E5A7AA0069;
 Fri, 10 Jul 2020 20:07:27 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 92828800DF;
 Fri, 10 Jul 2020 20:07:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="lsTLG3wv";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUlg2nqanMdW+vKGWuHM2e+ETq5AGAwUUBInQgqHj5wuRO/O8uuyQm0v68k9/+J56pJ28U6I80/u0oAP2xo/BW+y1jxkd1PrPCuZN7bHlk8NeCmcO3c+ZwpGCehE3K6yTWgWvim20MvzTrudo0Uu30zfuhhwJ7Uk4OObkpgFUn4aPzpKDmLX2xHz9gZB3hHTYIw7AAViPd5DEM3+zcoTivSLhf0kzlmvqD7wSpC2eHBsU+b5lhvOZ23GbpPyvypwtzMhUxa/NCl9K0GcM0UQvWnYY2sW5Wnt/hJjPO2ClB8nhs549FxmDtekWf2IOkkuQonaiqcD2HUohiTcOCfIuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2PJc1J5PWP26lGdyMprAw05GtZgB1cyUeHKYbvWZiM=;
 b=ONsbyTfdj4ZPxcPYOoSjBfYnbcdPWkTPP8JCQa1AS6tXbgX7viirApvnXLzOe24VNkwYLtcwExN93nriEdBQLYj4AegDCVWxsI4HH6AbQS0DzlKIwj9GyWfjegyGjpOXy7UpMqHA1iYMLEu8TKQGWzyaV2jIEH5cwoX6aWGWppU5R1iiOtIj/AI/1n0IVFlSmVctQ/STtcQflb+RsiS03MxJfWXr+4bXo5kKYIIiNILMF8PUFEHPuDcIZdPoWlSvFCFFQYbb8lLIHToI6KmPVFyM/BwITd8JW8h9qhqQ/HopeKpiO1TYqJk6A2CaGeSGxeewBpxb6G66MbaYVn00OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2PJc1J5PWP26lGdyMprAw05GtZgB1cyUeHKYbvWZiM=;
 b=lsTLG3wvTIHmZBLH2NrfUtkkrJFsbTpckLpTWHUad9/GzN+tF6V6j7Y2ykS8etKYffIIIVtIKGcNg3GBBTyAmKmrwS7S2dBDWc61QZVvAK709YNqQ60u8w1Sb7cTQiu4ksg2e45RgfXZ5kjsspw/y68DUWdPfQ5V5WRL0Bn6KFE=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3205.namprd12.prod.outlook.com (2603:10b6:a03:134::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Fri, 10 Jul
 2020 20:07:25 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3174.023; Fri, 10 Jul 2020
 20:07:23 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Florian Weimer <fweimer@redhat.com>, Vineet Gupta via Libc-alpha
 <libc-alpha@sourceware.org>
Subject: Re: ARC testsuite regressions (was Re: [PATCH v7.2 07/13] ARC: Linux
 Syscall Interface)
Thread-Topic: ARC testsuite regressions (was Re: [PATCH v7.2 07/13] ARC: Linux
 Syscall Interface)
Thread-Index: AQHWVjjy32kEybdCoEKZf9ozCP0tuKj/zGwAgADASIuAAGtWAIAAE0odgAAzqwA=
Date: Fri, 10 Jul 2020 20:07:23 +0000
Message-ID: <ee2187d4-8383-8a8f-29ec-29c4b36007de@synopsys.com>
References: <8ec1c7a1-dd77-5f1f-a2a4-11d214152a0d@linaro.org>
 <20200707205506.31537-1-vgupta@synopsys.com>
 <b64d0df1-4229-d619-0ab1-ded287323775@linaro.org>
 <dce392e8-4e16-6a9e-d173-ea64ac375014@synopsys.com>
 <273d42de-dc2b-2101-8705-04b399bd46cc@linaro.org>
 <2c7b73bd-d738-6af8-90b0-514ad22d929f@synopsys.com>
 <130fbd5a-cec8-4930-0b5e-da53d8d582ea@synopsys.com>
 <5f20da5f-8612-099b-3257-56c18f10cfa0@synopsys.com>
 <CAKmqyKM4pgF=E6bzCdFqYkboGQWURjcVmAz-V5KVqTZts8otug@mail.gmail.com>
 <87o8on4t38.fsf@oldenburg2.str.redhat.com>
 <cf8e41c7-8a58-f9bc-ab6a-ca5099bf6b46@synopsys.com>
 <87a707z4kr.fsf@oldenburg2.str.redhat.com>
In-Reply-To: <87a707z4kr.fsf@oldenburg2.str.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac7b7039-eaef-4c3a-ba91-08d8250cdc30
x-ms-traffictypediagnostic: BYAPR12MB3205:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3205700EEA6C5BA69F875483B6650@BYAPR12MB3205.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MtWJ72PT/i2SPLqRRng4488CkUaxSCBt9ZevGtsfmdiUh3CQRJvGADYzX2Y0u2Vm2YZpgDib7TN+GSZkAC77nUzOveaCfvd0SlWSxw0HqidquTp7y39m9w5FEgKQKbws1HBz9ShJkDzaviourtUVr89cvw0bL2DrZYFSGGK35BMwc7B7We43T73yqcIYV7Xy/ODZJloKusM3BGsqd3hQ6nmeDsEdUOYnfsze5LmFaiAdbLpaS6dRRxpGBNePxqEoFhei4aYTvZ5lCoMKdmXXX2jkL5RzHzOpdmQhoxsz0rausmgMj3kpPAg0Hge1R/uR/R45JX5CwayNpidLLdTKBE7oU6TAnJSFYh4361pQ3THGsl3/7KE6fKnxpKRUlzCM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(396003)(39860400002)(346002)(136003)(366004)(478600001)(53546011)(6506007)(8936002)(31686004)(6486002)(76116006)(66476007)(66556008)(66446008)(64756008)(66946007)(83380400001)(71200400001)(5660300002)(4326008)(86362001)(8676002)(316002)(186003)(2616005)(26005)(54906003)(31696002)(6512007)(36756003)(110136005)(2906002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: DXrCPaaeQVupv0MDLtC8rc/84WjNzUU2Lp13y15FRCbO8cR/Z7EVGnm8S2LjJQdg5wJVO645hCvpIhkbz5MxT6F7zEgJbEJhMguGqRdg9mNN4Xq37vtoZUnA5Eid0hPdelcWPd7Qu2NpRF5sCyjsnYdUS5UXljeCfBteRUJQtiNi3Sv7+QgwqMHT6K4rMt3UKm/LfIMHwwm1Akjr12XuSHsgVV4k98oLKGMn8s0RNAsepbgB33AtJRboaZMaRFtnsBVz8CFH8zHjqeDP7aSm4B3zg+kTKydy9n8j8OPUxhEzs8N8ob6oiLx4EDgYOETz6m3HhmJHJSzRUNVkG2zu7ONQPnzyyQnZ71+LjeyGXTFENNPDNsZ6dJ9xB6yoycSVnSu+EDdTXKE79WPwHJT2lvdBMxYTUZ24h003qtvpPegQg/swojQEkd2dQCDme63rqftlTNB7sjEKyW2SCrbV9zrsd3vQEn7uEyLWQfUNiCNL7u2e2EwPNR69Gyg7+YjX
Content-ID: <57A7B9AE302447449A10DC164F818E2A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7b7039-eaef-4c3a-ba91-08d8250cdc30
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2020 20:07:23.6241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a6t62He4J125BQTTLh4oYOWBs9JkP/+bzp2FrSOtx7L1s9NxieQ4xGulW+yDc7cDVCA3tk8gWM8r13yf00ltCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_160734_239913_FF239539 
X-CRM114-Status: GOOD (  22.84  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 7/10/20 10:02 AM, Florian Weimer via Libc-alpha wrote:
> * Vineet Gupta via Libc-alpha:
> 
>> From scratch meaning glibc alone or the whole toolchain. I used
>> buildroot and glibc-dirclean to nuke entire glibc but gcc was not
>> rebuilt. I can try that too.
> 
> No, rebuilding glibc from scratch should be fine.

Right, I clean built the entire toolchain and that didn't help - but turned out to
be sane thing anyways as installed headers seems were not rebuilt/installed and I
needed the signum.h -> signum-arch.h fixup in vfork.S


>> Some of the failed tests have prints about static TLS block ... so I'm
>> wondering if they could be related ?
>>
>> | $ cat dlfcn/tststatic.out
>> | .../build/libc.so.6: cannot allocate memory in static TLS block
> 
> This suggests to me that the static initialization code does not produce
> sufficient alignment for the TCB, given the 32-byte alignment required
> by the rseq area.
> 
> You could try and see what happens if you change
> sysdeps/arc/nptl/pthreaddef.h to this:
> 
> /* Alignment requirement for TCB.  */
> #define TCB_ALIGNMENT           32
> 
> If that helps, we have more of a generic issue here. 8-/

Bingo, that fixes all the dlfcn/* failures (full testsuite still running)

PASS: dlfcn/tststatic
PASS: dlfcn/tststatic2
PASS: dlfcn/tststatic3
PASS: dlfcn/tststatic4
PASS: dlfcn/tststatic5

So is that the fix or more is needed ?

> The problem is that the TLS memory allocator does not add alignment
> padding on its own.  This could meet additional alignment requirements
> if there is just one thread yet when higher-aligned TLS is loaded.
> 
>> Also while we figure this out, does this prevent ARC port from being
>> committed.
> 
> I don't think so.  We just have to make sure that it does not block the
> release, i.e. resolve this during the next week or two.  Do you think
> that would that be possible?

So it makes sens to commit ARC port now and your fix along the lines can then say
what it fixed in-tree.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
