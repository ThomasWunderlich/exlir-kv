defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link
    {:ok, bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    # bucket is now the bucket from setup
    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  test "deletes values by key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "juice") == nil
    KV.Bucket.put(bucket, "juice", 2)
    assert KV.Bucket.get(bucket, "juice") == 2
    KV.Bucket.delete(bucket, "juice")
    assert KV.Bucket.get(bucket, "juice") == nil
  end

end
